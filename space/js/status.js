(function () {
  'use strict';

  var container = document.getElementById('space-status');
  if (!container || !window.fetch || !window.AbortController) {
    return;
  }

  var text = document.getElementById('space-status-text');
  var warning = document.getElementById('space-status-warning');
  var refreshInterval = 60000;
  var requestTimeout = 8000;
  var timer;
  var controller;
  var refreshPending = false;
  var suspended = false;
  var messages = {
    loading: '正在查詢工寮狀態 · API updating...',
    open: '工寮目前開放中 · Opening',
    closed: '工寮目前關門中 · Closed',
    unknown: '目前無法確認開放狀態 · API unavailable'
  };

  function render(state, stale) {
    container.setAttribute('data-state', state);
    // Avoid repeatedly announcing an unchanged status to screen readers.
    if (text.textContent !== messages[state]) {
      text.textContent = messages[state];
    }
    warning.hidden = !stale;
  }

  async function refresh() {
    if (document.hidden || suspended) {
      return;
    }
    if (controller) {
      refreshPending = true;
      return;
    }

    window.clearTimeout(timer);
    controller = new AbortController();
    var timeout = window.setTimeout(function () {
      controller.abort();
    }, requestTimeout);

    try {
      var response = await fetch('https://moztw.space/api', {
        signal: controller.signal,
        credentials: 'omit'
      });
      if (!response.ok) {
        throw new Error('Status request failed');
      }
      var data = await response.json();
      if (!data || !data.state || typeof data.state.open !== 'boolean') {
        throw new Error('Status unavailable');
      }
      render(data.state.open ? 'open' : 'closed',
        Boolean(data.sensors_meta && data.sensors_meta.stale === true));
    } catch (error) {
      render('unknown', false);
    } finally {
      window.clearTimeout(timeout);
      controller = null;
      if (!document.hidden && !suspended) {
        if (refreshPending) {
          refreshPending = false;
          refresh();
        } else {
          timer = window.setTimeout(refresh, refreshInterval);
        }
      }
    }
  }

  document.addEventListener('visibilitychange', function () {
    window.clearTimeout(timer);
    refreshPending = false;
    if (!document.hidden) {
      render('loading', false);
      refresh();
    }
  });

  window.addEventListener('pagehide', function () {
    suspended = true;
    refreshPending = false;
    window.clearTimeout(timer);
    if (controller) {
      controller.abort();
    }
  });

  window.addEventListener('pageshow', function (event) {
    if (event.persisted) {
      suspended = false;
      render('loading', false);
      refresh();
    }
  });

  render('loading', false);
  refresh();
}());
