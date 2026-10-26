(function () {
  'use strict';

  var container = document.getElementById('space-status');
  var environment = document.getElementById('space-environment');
  if ((!container && !environment) || !window.fetch || !window.AbortController) {
    return;
  }

  var text = document.getElementById('space-status-text');
  var statusTimestamp = document.getElementById('space-status-timestamp');
  var readings = environment ? environment.querySelectorAll('[data-sensor]') : [];
  var notice = document.getElementById('space-environment-notice');
  var timestamp = document.getElementById('space-environment-timestamp');
  var time = document.getElementById('space-environment-time');
  var co2Bar = document.getElementById('space-co2-bar');
  var hasSensorReadings = false;
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

  function setText(element, value) {
    // Avoid repeatedly announcing an unchanged status to screen readers.
    if (element.textContent !== value) {
      element.textContent = value;
    }
  }

  function formatUpdatedAt(value) {
    var parsed = typeof value === 'string' ? Date.parse(value) : NaN;
    return Number.isFinite(parsed) ? new Date(parsed).toLocaleString('zh-TW', {
      timeZone: 'Asia/Taipei', year: 'numeric', month: '2-digit', day: '2-digit',
      hour: '2-digit', minute: '2-digit', second: '2-digit', hourCycle: 'h23'
    }) : '';
  }

  function renderStatus(state, fetchedAt, stale) {
    if (!container) {
      return;
    }
    container.setAttribute('data-state', state);
    setText(text, messages[state]);
    var updatedAt = formatUpdatedAt(fetchedAt);
    statusTimestamp.hidden = stale !== true || !updatedAt || (state !== 'open' && state !== 'closed');
    if (!statusTimestamp.hidden) {
      setText(statusTimestamp, '（資料更新：' + updatedAt + '）');
    }
  }

  function getCO2Bar(co2) {
    if (!Number.isFinite(co2) || co2 < 0) {
      return null;
    }
    return {
      width: Math.max(10, Math.min(100, ((co2 - 400) / 800) * 100)) + '%',
      color: co2 <= 600 ? '#299764' : co2 <= 800 ? '#E39A26' : '#D94B45'
    };
  }

  function renderEnvironment(data) {
    if (!environment) {
      return;
    }
    var sensors = data.sensors || {};
    var available = 0;
    for (var i = 0; i < readings.length; i++) {
      var field = readings[i];
      var type = field.getAttribute('data-sensor');
      var location = field.getAttribute('data-location');
      var unit = field.getAttribute('data-unit');
      var sensor = Array.isArray(sensors[type]) ? sensors[type].find(function (item) {
        return item && item.location === location && item.unit === unit &&
          Number.isFinite(item.value) && (type !== 'carbondioxide' || item.value >= 0);
      }) : undefined;
      var value = '—';
      if (sensor) {
        available++;
        value = type === 'temperature' ? sensor.value.toFixed(1) :
          type === 'carbondioxide' ? String(Math.round(sensor.value)) :
          String(Math.round(sensor.value * 10) / 10);
      }
      setText(field, value);
      if (field.classList.contains('sensor-value')) {
        // Keep 48px when it fits; only shrink long numbers in narrow columns.
        var characters = value.length - (value.match(/[.\-]/g) || []).length * 0.5;
        var characterWidth = type === 'temperature' ? 0.57 : 0.6;
        field.style.setProperty('--sensor-character-width', Math.max(1, characters) * characterWidth);
      }
      if (type === 'carbondioxide' && location === 'inside' && co2Bar) {
        var bar = getCO2Bar(sensor ? sensor.value : NaN);
        co2Bar.style.width = bar ? bar.width : '0%';
        co2Bar.style.backgroundColor = bar ? bar.color : 'transparent';
      }
    }

    hasSensorReadings = available > 0;
    var metadata = data.sensors_meta || {};
    var stale = metadata.stale === true;
    var fetchedAt = typeof metadata.fetched_at === 'string' ?
      Date.parse(metadata.fetched_at) : NaN;
    timestamp.hidden = !hasSensorReadings || !Number.isFinite(fetchedAt);
    if (!timestamp.hidden) {
      time.dateTime = new Date(fetchedAt).toISOString();
      setText(time, formatUpdatedAt(metadata.fetched_at));
    }

    var message = !hasSensorReadings ? '目前無法取得環境資料 · API unavailable' :
      available < readings.length ? '部分感測資料暫未提供' : '';
    if (hasSensorReadings && stale) {
      message += (message ? ' ' : '') + '(API stale and is waiting for update)';
    }
    setText(notice, message);
    notice.hidden = !message;
    environment.setAttribute('data-state', hasSensorReadings ?
      (stale ? 'stale' : 'ready') : 'unknown');
  }

  function renderLoading() {
    renderStatus('loading');
    if (environment) {
      environment.setAttribute('data-state', 'loading');
      setText(notice, hasSensorReadings ?
        '正在更新，以上為最後取得資料 · API updating...' :
        '正在查詢環境資料 · API updating...');
      notice.hidden = false;
    }
  }

  function renderError() {
    renderStatus('unknown');
    if (environment) {
      environment.setAttribute('data-state', 'unavailable');
      setText(notice, hasSensorReadings ?
        '目前無法更新，以上為最後取得資料 · API unavailable' :
        '目前無法取得環境資料 · API unavailable');
      notice.hidden = false;
    }
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
      if (!data || typeof data !== 'object' || Array.isArray(data)) {
        throw new Error('Invalid API response');
      }
      var state = data.state && typeof data.state.open === 'boolean' ?
        (data.state.open ? 'open' : 'closed') : 'unknown';
      renderStatus(state, data.sensors_meta && data.sensors_meta.fetched_at,
        data.sensors_meta && data.sensors_meta.stale);
      renderEnvironment(data);
    } catch (error) {
      renderError();
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
      renderLoading();
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
      renderLoading();
      refresh();
    }
  });

  renderLoading();
  refresh();
}());
