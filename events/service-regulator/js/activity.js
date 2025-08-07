// 倡議活動頁面互動功能
document.addEventListener('DOMContentLoaded', function() {
    // 初始化頁面
    initActivity();

    // 綁定事件監聽器
    bindEventListeners();
});

function initActivity() {
    // 隱藏所有答案區域
    hideAllAnswers();

    // 隱藏倡議區域
    hideAdvocateSection();

    // 顯示猜測區域
    showGuessSection();
}

function bindEventListeners() {
    // 綁定猜測選項點擊事件
    const guessOptions = document.querySelectorAll('.guess-option');
    guessOptions.forEach(option => {
        option.addEventListener('click', function(e) {
            e.preventDefault();
            const answerId = this.getAttribute('data-answer');
            showAnswer(answerId);
        });
    });

    // 綁定返回按鈕事件
    const backButtons = document.querySelectorAll('.back-to-guess');
    backButtons.forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault();
            showGuessSection();
        });
    });
}

function showGuessSection() {
    // 隱藏所有答案
    hideAllAnswers();

    // 隱藏倡議區域
    hideAdvocateSection();

    // 顯示猜測區域
    const guessSection = document.getElementById('guess');
    if (guessSection) {
        guessSection.style.display = 'block';
    }
}

function showAnswer(answerId) {
    // 隱藏猜測區域
    const guessSection = document.getElementById('guess');
    if (guessSection) {
        guessSection.style.display = 'none';
    }

    // 隱藏所有答案
    hideAllAnswers();

    // 顯示選中的答案
    const answerElement = document.getElementById(answerId);
    if (answerElement) {
        answerElement.classList.add('show');
        // 如果是正確答案，顯示倡議區域
        if (answerId === 'answer_unlimited') {
            setTimeout(() => {
                showAdvocateSection();
            }, 1500);
        }
    }
}

function hideAllAnswers() {
    const answers = document.querySelectorAll('.answer');
    answers.forEach(answer => {
        answer.classList.remove('show');
    });
}

function hideAdvocateSection() {
    const advocateSection = document.getElementById('advocate');
    if (advocateSection) {
        advocateSection.style.display = 'none';
    }
}

function showAdvocateSection() {
    const advocateSection = document.getElementById('advocate');
    if (advocateSection) {
        advocateSection.style.display = 'block';
        // TODO: 恢復平滑捲動
        // advocateSection.scrollIntoView({ behavior: 'smooth' });
    }
}

function smoothScrollTo(element) {
    const targetPosition = element.offsetTop - 100;
    const startPosition = window.pageYOffset;
    const distance = targetPosition - startPosition;
    const duration = 800;
    let start = null;

    function animation(currentTime) {
        if (start === null) start = currentTime;
        const timeElapsed = currentTime - start;
        const run = ease(timeElapsed, startPosition, distance, duration);
        window.scrollTo(0, run);
        if (timeElapsed < duration) requestAnimationFrame(animation);
    }

    function ease(t, b, c, d) {
        t /= d / 2;
        if (t < 1) return c / 2 * t * t + b;
        t--;
        return -c / 2 * (t * (t - 2) - 1) + b;
    }

    requestAnimationFrame(animation);
}

// 添加一些視覺效果
function addVisualEffects() {
    // 為猜測選項添加點擊效果
    const guessOptions = document.querySelectorAll('.guess-option');
    guessOptions.forEach(option => {
        option.addEventListener('click', function() {
            // 添加點擊動畫
            this.style.transform = 'scale(0.95)';
            setTimeout(() => {
                this.style.transform = '';
            }, 150);
        });
    });

    // 為答案區域添加進入動畫
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    });

    const answerSections = document.querySelectorAll('.answer, #advocate, #detail, #laws, #readmore');
    answerSections.forEach(section => {
        section.style.opacity = '0';
        section.style.transform = 'translateY(20px)';
        section.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(section);
    });
}

// 頁面載入完成後初始化視覺效果
window.addEventListener('load', function() {
    addVisualEffects();
});

// 添加鍵盤導航支援
document.addEventListener('keydown', function(e) {
    const currentAnswer = document.querySelector('.answer.show');

    if (e.key === 'Escape' && currentAnswer) {
        // ESC 鍵返回猜測區域
        showGuessSection();
    } else if (e.key >= '1' && e.key <= '5') {
        // 數字鍵 1-5 選擇答案
        const answerMap = {
            '1': 'answer_1',
            '2': 'answer_2',
            '3': 'answer_3',
            '4': 'answer_4',
            '5': 'answer_unlimited'
        };

        const answerId = answerMap[e.key];
        if (answerId) {
            showAnswer(answerId);
        }
    }
});

// 添加分享功能
function addShareFunctionality() {
    const shareButton = document.createElement('button');
    shareButton.textContent = '分享活動頁面';
    shareButton.className = 'share-button';
    shareButton.style.cssText = `
        position: fixed;
        bottom: 20px;
        right: 20px;
        background: var(--primary-color);
        color: white;
        border: none;
        padding: 12px 20px;
        border-radius: 25px;
        cursor: pointer;
        box-shadow: var(--shadow);
        z-index: 1000;
        font-weight: 600;
    `;

    shareButton.addEventListener('click', function() {
        if (navigator.share) {
            navigator.share({
                title: '2025 年在台灣經營一個網路平台，上頭有多少個主管機關？',
                text: '來猜猜看台灣網路平台面臨的監管挑戰！',
                url: window.location.href
            });
        } else {
            // 複製連結到剪貼簿
            navigator.clipboard.writeText(window.location.href).then(() => {
                alert('連結已複製到剪貼簿！');
            });
        }
    });

    document.body.appendChild(shareButton);
}

// 初始化分享功能
document.addEventListener('DOMContentLoaded', function() {
    addShareFunctionality();
});
