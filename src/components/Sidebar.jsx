import { useEffect, useRef, useCallback, useState } from 'react';

export default function Sidebar({
    pdfDoc, pageNum, goToPage, isOpen, onClose, outline, searchIndices, searchText, toggleSidebar
}) {
    const containerRef = useRef(null);
    const thumbnailsRef = useRef({});
    const [activeTab, setActiveTab] = useState('pages'); // 'pages', 'outline', 'search'

    // Generate thumbnail for a specific page
    const renderThumbnail = useCallback(async (page, canvas) => {
        const viewport = page.getViewport({ scale: 0.2 });
        canvas.height = viewport.height;
        canvas.width = viewport.width;
        const ctx = canvas.getContext('2d');
        await page.render({ canvasContext: ctx, viewport }).promise;
    }, []);

    // Effect for thumbnails
    useEffect(() => {
        if (!pdfDoc || activeTab !== 'pages' || !containerRef.current) return;
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

            pdfDoc.getPage(i).then((page) => {
                const canvas = document.createElement('canvas');
                renderThumbnail(page, canvas).then(() => {
                    if (placeholder.parentNode) {
                        placeholder.parentNode.replaceChild(canvas, placeholder);
                    }
                });
            });
        }
    }, [pdfDoc, goToPage, onClose, renderThumbnail, activeTab, pageNum]);

    // Update active thumbnail scroll
    useEffect(() => {
        if (activeTab === 'pages' && thumbnailsRef.current[pageNum]) {
            thumbnailsRef.current[pageNum].scrollIntoView({ behavior: 'smooth', block: 'nearest' });
        }
    }, [pageNum, activeTab]);

    const goToDestination = useCallback(async (dest) => {
        if (!dest) return;
        try {
            // Resolve destination to page index
            const explicitDest = typeof dest === 'string'
                ? await pdfDoc.getDestination(dest)
                : dest;

            if (explicitDest && explicitDest[0]) {
                const pageNum = await pdfDoc.getPageIndex(explicitDest[0]);
                goToPage(pageNum + 1);
                if (window.innerWidth <= 768) onClose();
            }
        } catch (err) {
            console.error("Error jumping to destination:", err);
        }
    }, [pdfDoc, goToPage, onClose]);

    const renderOutlineItem = (item, index) => {
        return (
            <div key={index} className="outline-item-wrap">
                <div className="outline-item" onClick={() => goToDestination(item.dest)}>
                    <span className="outline-title">{item.title}</span>
                </div>
                {item.items && item.items.length > 0 && (
                    <div className="outline-children">
                        {item.items.map((child, i) => renderOutlineItem(child, i))}
                    </div>
                )}
            </div>
        );
    };

    // Close on Esc
    useEffect(() => {
        const handleEsc = (e) => {
            if (e.key === 'Escape' && isOpen) onClose();
        };
        window.addEventListener('keydown', handleEsc);
        return () => window.removeEventListener('keydown', handleEsc);
    }, [isOpen, onClose]);

    return (
        <>
            <div className={`sidebar ${isOpen ? 'open' : ''}`}>
                <div className="sidebar-header">
                    <div className="sidebar-tabs">
                        <button
                            className={`tab-btn ${activeTab === 'pages' ? 'active' : ''}`}
                            onClick={() => setActiveTab('pages')}
                            title="Pages"
                        >
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><rect x="3" y="3" width="18" height="18" rx="2" ry="2" /><line x1="3" y1="9" x2="21" y2="9" /><line x1="9" y1="21" x2="9" y2="9" /></svg>
                        </button>
                        <button
                            className={`tab-btn ${activeTab === 'outline' ? 'active' : ''}`}
                            onClick={() => setActiveTab('outline')}
                            title="Outline"
                        >
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><line x1="8" y1="6" x2="21" y2="6" /><line x1="8" y1="12" x2="21" y2="12" /><line x1="8" y1="18" x2="21" y2="18" /><line x1="3" y1="6" x2="3.01" y2="6" /><line x1="3" y1="12" x2="3.01" y2="12" /><line x1="3" y1="18" x2="3.01" y2="18" /></svg>
                        </button>
                        <button
                            className={`tab-btn ${activeTab === 'search' ? 'active' : ''}`}
                            onClick={() => setActiveTab('search')}
                            title="Search Results"
                        >
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><circle cx="11" cy="11" r="8" /><line x1="21" y1="21" x2="16.65" y2="16.65" /></svg>
                        </button>
                    </div>
                    <button className="icon-btn" title="Close Sidebar" onClick={onClose}>
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><line x1="18" y1="6" x2="6" y2="18" /><line x1="6" y1="6" x2="18" y2="18" /></svg>
                    </button>
                </div>

                <div className="sidebar-content">
                    {activeTab === 'pages' && <div className="thumbnails" ref={containerRef} />}

                    {activeTab === 'outline' && (
                        <div className="outline-view">
                            {outline && outline.length > 0 ? (
                                outline.map((item, i) => renderOutlineItem(item, i))
                            ) : (
                                <div className="sidebar-empty">No outline available</div>
                            )}
                        </div>
                    )}

                    {activeTab === 'search' && (
                        <div className="search-results-view">
                            {searchText ? (
                                searchIndices && searchIndices.length > 0 ? (
                                    searchIndices.map((res, i) => (
                                        <div key={i} className="search-result-item" onClick={() => goToPage(res.pageNum)}>
                                            <div className="result-page">Page {res.pageNum}</div>
                                            <div className="result-snippet">{res.text}</div>
                                        </div>
                                    ))
                                ) : (
                                    <div className="sidebar-empty">No results found for "{searchText}"</div>
                                )
                            ) : (
                                <div className="sidebar-empty">Enter text in the search bar to see results here</div>
                            )}
                        </div>
                    )}
                </div>
            </div>
            {pdfDoc && (
                <button
                    className={`sidebar-toggle ${pdfDoc ? 'active' : ''}`}
                    title="Toggle Sidebar"
                    onClick={toggleSidebar}
                    style={{ display: pdfDoc ? 'block' : 'none' }}
                >
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><polyline points={isOpen ? '9 18 15 12 9 6' : '15 18 9 12 15 6'} /></svg>
                </button>
            )}
        </>
    );
}
