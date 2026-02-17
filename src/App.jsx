import { useRef, useState } from 'react';
import usePdfViewer from './hooks/usePdfViewer';
import LandingPage from './components/LandingPage';
import Header from './components/Header';
import Toolbar from './components/Toolbar';
import DropZone from './components/DropZone';
import PDFCanvas from './components/PDFCanvas';
import Sidebar from './components/Sidebar';
import Loader from './components/Loader';
import ErrorModal from './components/ErrorModal';
import Background from './components/Background';

export default function App() {
  const fileInputRef = useRef(null);
  const viewer = usePdfViewer();
  const [showLanding, setShowLanding] = useState(true);

  const handleStartLearning = () => {
    setShowLanding(false);
    // Trigger file picker after a brief moment
    setTimeout(() => fileInputRef.current?.click(), 100);
  };

  const handleFileSelect = (file) => {
    viewer.handleFileSelect(file);
    setShowLanding(false);
  };

  // Show landing page if no PDF is loaded
  if (showLanding && !viewer.pdfLoaded) {
    return (
      <div className="light-theme">
        <LandingPage onStartLearning={handleStartLearning} />
      </div>
    );
  }

  // Show PDF viewer
  return (
    <div className={viewer.isDark ? 'dark-theme' : 'light-theme'}>
      <Background />
      <div className="app-container">
        <Header
          fileName={viewer.fileName}
          isDark={viewer.isDark}
          toggleTheme={viewer.toggleTheme}
          onOpenFile={() => fileInputRef.current?.click()}
        />
        <input
          ref={fileInputRef}
          type="file"
          accept="application/pdf"
          style={{ display: 'none' }}
          onChange={(e) => {
            const f = e.target.files?.[0];
            if (f) handleFileSelect(f);
          }}
        />

        <main>
          <Toolbar
            scale={viewer.scale}
            pageNum={viewer.pageNum}
            totalPages={viewer.totalPages}
            zoomIn={viewer.zoomIn}
            zoomOut={viewer.zoomOut}
            prevPage={viewer.prevPage}
            nextPage={viewer.nextPage}
            rotate={viewer.rotate}
            toggleFullscreen={viewer.toggleFullscreen}
            downloadPDF={viewer.downloadPDF}
            printPDF={viewer.printPDF}
            pdfLoaded={viewer.pdfLoaded}
          />

          <PDFCanvas
            canvasRef={viewer.canvasRef}
            pageNum={viewer.pageNum}
            totalPages={viewer.totalPages}
            prevPage={viewer.prevPage}
            nextPage={viewer.nextPage}
            pdfLoaded={viewer.pdfLoaded}
          />

          <DropZone
            onFileSelect={handleFileSelect}
            visible={!viewer.pdfLoaded}
          />
        </main>

        <Sidebar
          pdfDoc={viewer.pdfDoc}
          pageNum={viewer.pageNum}
          goToPage={viewer.goToPage}
          isOpen={viewer.sidebarOpen}
          onClose={viewer.toggleSidebar}
        />
      </div>

      <Loader visible={viewer.isLoading} />
      <ErrorModal message={viewer.error} onClose={viewer.clearError} />
    </div>
  );
}

