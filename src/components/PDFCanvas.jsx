export default function PDFCanvas({ canvasRef, pageNum, totalPages, prevPage, nextPage, pdfLoaded }) {
    if (!pdfLoaded) return null;

    return (
        <div className="pdf-container">
            <canvas ref={canvasRef} id="pdf-canvas" />

            <div className="nav-arrows">
                <div
                    className="nav-arrow prev"
                    onClick={prevPage}
                    style={{ opacity: pageNum <= 1 ? 0.3 : 0.7, pointerEvents: pageNum <= 1 ? 'none' : 'auto' }}
                    title="Previous Page"
                >
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><polyline points="15 18 9 12 15 6" /></svg>
                </div>
                <div
                    className="nav-arrow next"
                    onClick={nextPage}
                    style={{ opacity: pageNum >= totalPages ? 0.3 : 0.7, pointerEvents: pageNum >= totalPages ? 'none' : 'auto' }}
                    title="Next Page"
                >
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><polyline points="9 18 15 12 9 6" /></svg>
                </div>
            </div>

            <div className="keyboard-hint">
                <span>←</span> Previous | <span>→</span> Next | <span>+</span> Zoom In | <span>−</span> Zoom Out |{' '}
                <span>F</span> Fullscreen | <span>T</span> Theme
            </div>
        </div>
    );
}
