// Smooth scrolling for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Add active class to navigation items on scroll
const sections = document.querySelectorAll('section[id]');
const navLinks = document.querySelectorAll('.nav-menu a[href^="#"]');

function highlightNavigation() {
    const scrollY = window.pageYOffset;

    sections.forEach(section => {
        const sectionHeight = section.offsetHeight;
        const sectionTop = section.offsetTop - 50;
        const sectionId = section.getAttribute('id');

        if (scrollY > sectionTop && scrollY <= sectionTop + sectionHeight) {
            navLinks.forEach(link => {
                if (link.getAttribute('href') === `#${sectionId}`) {
                    link.style.color = 'var(--primary-color)';
                } else {
                    link.style.color = '';
                }
            });
        }
    });
}

window.addEventListener('scroll', highlightNavigation);

// Add animation on scroll
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.animation = 'fadeInUp 0.6s ease';
            entry.target.style.opacity = '1';
        }
    });
}, observerOptions);

document.querySelectorAll('.project-card, .about-text').forEach(el => {
    el.style.opacity = '0';
    observer.observe(el);
});

// Console message
console.log('%c 欢迎来到我的网站！', 'color: #6366f1; font-size: 20px; font-weight: bold;');

// Thumbnail hover effect - create invisible overlay to limit hover area
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.thumbnail-container').forEach(container => {
        // Create an invisible div to track mouse position within original bounds
        const overlay = document.createElement('div');
        overlay.className = 'hover-overlay';
        overlay.style.cssText = 'position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 10; pointer-events: auto;';
        container.appendChild(overlay);
    });
});

