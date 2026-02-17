export default function Toolbar({
    scale, pageNum, totalPages,
    zoomIn, zoomOut, prevPage, nextPage,
    rotate, toggleFullscreen, downloadPDF, printPDF, pdfLoaded
}) {
    if (!pdfLoaded) return null;

    return (
        <div className="toolbar active">
            <div className="zoom-controls">
                <button className="tool-btn" title="Zoom Out (−)" onClick={zoomOut} disabled={scale <= 0.5} aria-label="Zoom out">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><circle cx="11" cy="11" r="8" /><line x1="21" y1="21" x2="16.65" y2="16.65" /><line x1="8" y1="11" x2="14" y2="11" /></svg>
                </button>
                <span className="zoom-level">{Math.round(scale * 100)}%</span>
                <button className="tool-btn" title="Zoom In (+)" onClick={zoomIn} disabled={scale >= 3.0} aria-label="Zoom in">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><circle cx="11" cy="11" r="8" /><line x1="21" y1="21" x2="16.65" y2="16.65" /><line x1="11" y1="8" x2="11" y2="14" /><line x1="8" y1="11" x2="14" y2="11" /></svg>
                </button>
            </div>
            <div className="page-controls">
                <button className="tool-btn" title="Previous (←)" onClick={prevPage} disabled={pageNum <= 1} aria-label="Previous page">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><polyline points="15 18 9 12 15 6" /></svg>
                </button>
                <div className="page-info">{pageNum} / {totalPages}</div>
                <button className="tool-btn" title="Next (→)" onClick={nextPage} disabled={pageNum >= totalPages} aria-label="Next page">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><polyline points="9 18 15 12 9 6" /></svg>
                </button>
            </div>
            <div className="view-controls">
                <button className="tool-btn" title="Rotate" onClick={rotate} aria-label="Rotate">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><polyline points="23 4 23 10 17 10" /><path d="M20.49 15a9 9 0 1 1-2.12-9.36L23 10" /></svg>
                </button>
                <button className="tool-btn" title="Fullscreen (F)" onClick={toggleFullscreen} aria-label="Fullscreen">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><polyline points="15 3 21 3 21 9" /><polyline points="9 21 3 21 3 15" /><line x1="21" y1="3" x2="14" y2="10" /><line x1="3" y1="21" x2="10" y2="14" /></svg>
                </button>
                <button className="tool-btn" title="Download" onClick={downloadPDF} aria-label="Download PDF">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4" /><polyline points="7 10 12 15 17 10" /><line x1="12" y1="15" x2="12" y2="3" /></svg>
                </button>
                <button className="tool-btn" title="Print" onClick={printPDF} aria-label="Print PDF">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><polyline points="6 9 6 2 18 2 18 9" /><path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2" /><rect x="6" y="14" width="12" height="8" /></svg>
                </button>
            </div>
        </div>
    );
}
