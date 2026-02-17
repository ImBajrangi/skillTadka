import { useEffect, useRef, useCallback } from 'react';

export default function Sidebar({ pdfDoc, pageNum, goToPage, isOpen, onClose }) {
    const containerRef = useRef(null);
    const thumbnailsRef = useRef({});

    // Generate thumbnail for a specific page
    const renderThumbnail = useCallback(async (page, canvas) => {
        const viewport = page.getViewport({ scale: 0.2 });
        canvas.height = viewport.height;
        canvas.width = viewport.width;
        const ctx = canvas.getContext('2d');
        await page.render({ canvasContext: ctx, viewport }).promise;
    }, []);

    useEffect(() => {
        if (!pdfDoc || !containerRef.current) return;
        const container = containerRef.current;
        container.innerHTML = '';
        thumbnailsRef.current = {};

        for (let i = 1; i <= pdfDoc.numPages; i++) {
            const thumb = document.createElement('div');
            thumb.className = `thumbnail ${i === pageNum ? 'active' : ''}`;
            thumb.dataset.page = i;

            const placeholder = document.createElement('div');
            placeholder.className = 'thumbnail-placeholder';

            const pageLabel = document.createElement('div');
            pageLabel.className = 'thumbnail-number';
            pageLabel.textContent = i;

            thumb.appendChild(placeholder);
            thumb.appendChild(pageLabel);
            container.appendChild(thumb);

            thumb.addEventListener('click', () => {
                goToPage(i);
                if (window.innerWidth <= 768) onClose();
            });

            thumbnailsRef.current[i] = thumb;

            // Render actual thumbnail
            pdfDoc.getPage(i).then((page) => {
                const canvas = document.createElement('canvas');
                renderThumbnail(page, canvas).then(() => {
                    if (placeholder.parentNode) {
                        placeholder.parentNode.replaceChild(canvas, placeholder);
                    }
                });
            });
        }
    }, [pdfDoc, goToPage, onClose, renderThumbnail]);

    // Update active thumbnail
    useEffect(() => {
        Object.entries(thumbnailsRef.current).forEach(([num, el]) => {
            if (parseInt(num) === pageNum) {
                el.classList.add('active');
                el.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
            } else {
                el.classList.remove('active');
            }
        });
    }, [pageNum]);

    return (
        <>
            <div className={`sidebar ${isOpen ? 'open' : ''}`}>
                <div className="sidebar-header">
                    <h3>Pages</h3>
                    <button className="icon-btn" title="Close Sidebar" onClick={onClose}>
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><line x1="18" y1="6" x2="6" y2="18" /><line x1="6" y1="6" x2="18" y2="18" /></svg>
                    </button>
                </div>
                <div className="thumbnails" ref={containerRef} />
            </div>
            {pdfDoc && (
                <button
                    className={`sidebar-toggle ${pdfDoc ? 'active' : ''}`}
                    title="Toggle Thumbnails"
                    onClick={() => isOpen ? onClose() : goToPage(pageNum) || document.querySelector('.sidebar')?.classList.toggle('open')}
                    style={{ display: pdfDoc ? 'block' : 'none' }}
                >
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><polyline points={isOpen ? '9 18 15 12 9 6' : '15 18 9 12 15 6'} /></svg>
                </button>
            )}
        </>
    );
}
