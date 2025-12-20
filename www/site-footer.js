/**
 * Site Footer & Modal Logic
 * Handles Credits, Support, and EULA modals across the site.
 */
document.addEventListener('DOMContentLoaded', () => {
    const openModal = (modalId) => {
        const modal = document.getElementById(modalId);
        if (modal) {
            modal.classList.add('active');
            document.body.style.overflow = 'hidden';
        }
    };

    const closeModal = (modal) => {
        if (modal) {
            modal.classList.remove('active');
            document.body.style.overflow = '';
        }
    };

    document.querySelectorAll('.btn-credits-trigger').forEach((btn) => {
        btn.addEventListener('click', (e) => {
            e.preventDefault();
            openModal('credits-modal');
        });
    });

    document.querySelectorAll('.btn-support-trigger').forEach((btn) => {
        btn.addEventListener('click', (e) => {
            e.preventDefault();
            openModal('support-modal');
        });
    });

    document.querySelectorAll('.btn-eula-trigger').forEach((btn) => {
        btn.addEventListener('click', (e) => {
            e.preventDefault();
            openModal('eula-modal');
        });
    });

    document.querySelectorAll('.modal-overlay').forEach((overlay) => {
        overlay.addEventListener('click', (e) => {
            if (e.target === overlay) {
                closeModal(overlay);
            }
        });

        const closeBtn = overlay.querySelector('.modal-close');
        if (closeBtn) {
            closeBtn.addEventListener('click', () => closeModal(overlay));
        }
    });

    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') {
            document.querySelectorAll('.modal-overlay.active').forEach((modal) => {
                closeModal(modal);
            });
        }
    });
});
