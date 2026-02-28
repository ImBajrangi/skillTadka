export default function PDFCanvas({
    canvasRef, textLayerRef, pageNum, totalPages, prevPage, nextPage, pdfLoaded, isFocusMode
}) {
    if (!pdfLoaded) return null;

    return (
        <div className={`pdf-container ${isFocusMode ? 'focus-mode' : ''}`}>
            <div className="pdf-wrapper">
                <canvas ref={canvasRef} id="pdf-canvas" />
                <div ref={textLayerRef} className="text-layer" />
            </div>

            <div className="nav-arrows">
                <button
                    className="nav-arrow prev"
                    onClick={prevPage}
                    disabled={pageNum <= 1}
                    title="Previous Page"
                >
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5"><polyline points="15 18 9 12 15 6" /></svg>
                </button>
                <button
                    className="nav-arrow next"
                    onClick={nextPage}
                    disabled={pageNum >= totalPages}
                    title="Next Page"
                >
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5"><polyline points="9 18 15 12 9 6" /></svg>
                </button>
            </div>

            <div className="keyboard-hint">
                <span>←</span> Prev | <span>→</span> Next | <span>+/−</span> Zoom | <span>Z</span> Focus | <span>F</span> Fullscreen | <span>T</span> Theme
            </div>
        </div>
    );
}
