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
console.log('%c Welcome to my website!', 'color: #6366f1; font-size: 20px; font-weight: bold;');

// Click-to-enlarge image lightbox (full image view)
document.addEventListener('DOMContentLoaded', function () {
    const overlay = document.createElement('div');
    overlay.className = 'lightbox-overlay';
    overlay.innerHTML = '<span class="lightbox-close" aria-label="Close">&times;</span><img class="lightbox-img" alt="">';
    document.body.appendChild(overlay);

    const lbImg = overlay.querySelector('.lightbox-img');

    function openLightbox(src, alt) {
        lbImg.src = src;
        lbImg.alt = alt || '';
        overlay.classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    function closeLightbox() {
        overlay.classList.remove('active');
        document.body.style.overflow = '';
    }

    overlay.addEventListener('click', closeLightbox);
    lbImg.addEventListener('click', function (e) { e.stopPropagation(); });
    document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape') closeLightbox();
    });

    // Make every content image clickable to view full size (exclude sidebar profile)
    Array.from(document.images).forEach(function (img) {
        if (img.closest('.sidebar') || img.classList.contains('lightbox-img') || img.classList.contains('no-zoom') || img.hasAttribute('onclick') || img.closest('a')) {
            return;
        }
        img.classList.add('zoomable');
        img.addEventListener('click', function (e) {
            e.preventDefault();
            e.stopPropagation();
            openLightbox(img.currentSrc || img.src, img.alt);
        });
    });
});

// Collapsible submenu - hide all submenus by default
document.addEventListener('DOMContentLoaded', function() {
    const allSubmenus = document.querySelectorAll('.sidebar-submenu');
    const currentPage = window.location.pathname.split('/').pop();
    
    // Hide all submenus initially
    allSubmenus.forEach(submenu => {
        submenu.style.display = 'none';
    });
    
    // Only show submenu if we're on the corresponding page
    const roboticsSubmenu = document.querySelector('a[href="robotics.html"]')?.parentElement?.querySelector('.sidebar-submenu');
    if (currentPage === 'robotics.html' && roboticsSubmenu) {
        roboticsSubmenu.style.display = 'block';
        // Also expand nested VEX submenu
        const vexSubmenu = roboticsSubmenu.querySelector('a[href*="#vex"]')?.parentElement?.querySelector('.sidebar-submenu');
        if (vexSubmenu) {
            vexSubmenu.style.display = 'block';
        }
    }
    
    const awardsSubmenu = document.querySelector('a[href="awards.html"]')?.parentElement?.querySelector('.sidebar-submenu');
    if (currentPage === 'awards.html' && awardsSubmenu) {
        awardsSubmenu.style.display = 'block';
    }
    
    const courseProjectsSubmenu = document.querySelector('a[href="course-projects.html"]')?.parentElement?.querySelector('.sidebar-submenu');
    if (currentPage === 'course-projects.html' && courseProjectsSubmenu) {
        courseProjectsSubmenu.style.display = 'block';
    }
    
});

