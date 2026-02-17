import { useCallback, useRef, useState } from 'react';

export default function DropZone({ onFileSelect, visible }) {
    const [isDragActive, setDragActive] = useState(false);
    const fileInputRef = useRef(null);

    const stop = useCallback((e) => { e.preventDefault(); e.stopPropagation(); }, []);

    const handleDrop = useCallback((e) => {
        stop(e);
        setDragActive(false);
        const file = e.dataTransfer?.files?.[0];
        if (file) onFileSelect(file);
    }, [onFileSelect, stop]);

    if (!visible) return null;

    return (
        <div
            className={`drop-area ${isDragActive ? 'active' : ''}`}
            onDragEnter={(e) => { stop(e); setDragActive(true); }}
            onDragOver={stop}
            onDragLeave={(e) => { stop(e); setDragActive(false); }}
            onDrop={handleDrop}
        >
            <div className="drop-message">
                <svg width="56" height="56" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.2" style={{ color: 'var(--accent)', marginBottom: '0.5rem' }}>
                    <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z" />
                    <polyline points="14 2 14 8 20 8" />
                    <line x1="12" y1="18" x2="12" y2="12" />
                    <polyline points="9 15 12 12 15 15" />
                </svg>
                <h2>Open a PDF File</h2>
                <p>Drag & drop your PDF here, or browse from your device</p>
                <input
                    ref={fileInputRef}
                    type="file"
                    accept="application/pdf"
                    style={{ display: 'none' }}
                    onChange={(e) => {
                        const file = e.target.files?.[0];
                        if (file) onFileSelect(file);
                    }}
                />
                <button className="file-input-label" onClick={() => fileInputRef.current?.click()}>
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z" /></svg>
                    Browse Files
                </button>
            </div>
        </div>
    );
}
