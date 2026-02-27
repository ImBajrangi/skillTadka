import { useState, useEffect, useRef, useCallback } from 'react';
import './LandingPage.css';

const MORPH_WORDS = ['Notes', 'PDFs', 'Books', 'Papers', 'Guides'];

export default function LandingPage({ onStartLearning }) {
    const [morphIdx, setMorphIdx] = useState(0);
    const [isExiting, setIsExiting] = useState(false);
    const heroRef = useRef(null);

    // Morphing text — smooth cycle
    useEffect(() => {
        const id = setInterval(() => {
            setIsExiting(true);
            setTimeout(() => {
                setMorphIdx((i) => (i + 1) % MORPH_WORDS.length);
                setIsExiting(false);
            }, 280);
        }, 2800);
        return () => clearInterval(id);
    }, []);

    // Subtle 3D tilt on hero
    const handleTilt = useCallback((e) => {
        if (!heroRef.current) return;
        const r = heroRef.current.getBoundingClientRect();
        const x = ((e.clientX - r.left) / r.width - 0.5) * 4;
        const y = ((e.clientY - r.top) / r.height - 0.5) * 4;
        heroRef.current.style.transform =
            `perspective(1200px) rotateY(${x}deg) rotateX(${-y}deg)`;
    }, []);

    const resetTilt = useCallback(() => {
        if (heroRef.current)
            heroRef.current.style.transform = 'perspective(1200px) rotateY(0) rotateX(0)';
    }, []);

    return (
        <div className="lp">
            {/* Subtle gradient backdrop */}
            <div className="lp-backdrop" aria-hidden="true">
                <div className="lp-glow lp-glow--1" />
                <div className="lp-glow lp-glow--2" />
            </div>

            {/* ── Header ── */}
            <header className="lp-header">
                <div className="lp-wrap">
                    <a className="lp-brand" href="/">
                        <svg className="lp-logo-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20" />
                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z" />
                        </svg>
                        <span className="lp-brand-text">skillTadka</span>
                    </a>

                    <nav className="lp-nav">
                        <a href="#features" className="lp-nav-link">Features</a>
                        <a href="#how" className="lp-nav-link">How It Works</a>
                        <button className="lp-cta-sm" onClick={onStartLearning}>Open Reader</button>
                    </nav>
                </div>
            </header>

            {/* ── Hero ── */}
            <section className="lp-hero">
                <div className="lp-wrap">
                    <div
                        ref={heroRef}
                        className="lp-hero-card"
                        onMouseMove={handleTilt}
                        onMouseLeave={resetTilt}
                    >
                        <div className="lp-hero-badge">Free · No Sign-up Required</div>

                        <div className="lp-hero-icon">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round">
                                <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z" />
                                <polyline points="14 2 14 8 20 8" />
                                <line x1="12" y1="18" x2="12" y2="12" />
                                <line x1="9" y1="15" x2="15" y2="15" />
                            </svg>
                        </div>

                        <h1 className="lp-title">
                            Read Your{' '}
                            <span className={`lp-morph ${isExiting ? 'lp-morph--out' : ''}`}>
                                {MORPH_WORDS[morphIdx]}
                            </span>
                        </h1>

                        <p className="lp-subtitle">
                            A fast, modern PDF viewer built for students.
                            <br className="lp-br-desktop" />
                            Drop a file — start studying in seconds.
                        </p>

                        <button className="lp-cta" onClick={onStartLearning}>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                                <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4" />
                                <polyline points="7 10 12 15 17 10" />
                                <line x1="12" y1="15" x2="12" y2="3" />
                            </svg>
                            Open a PDF
                        </button>

                        <p className="lp-hint">or drag &amp; drop your file anywhere on this page</p>
                    </div>
                </div>
            </section>

            {/* ── Features ── */}
            <section className="lp-features" id="features">
                <div className="lp-wrap">
                    <div className="lp-features-grid">
                        <div className="lp-feat">
                            <div className="lp-feat-icon">⚡</div>
                            <h3>Lightning Fast</h3>
                            <p>Renders instantly, even large textbooks. No waiting, no loading bars.</p>
                        </div>
                        <div className="lp-feat">
                            <div className="lp-feat-icon">🌙</div>
                            <h3>Dark Mode</h3>
                            <p>Easy on the eyes during late-night study sessions. Toggle in one click.</p>
                        </div>
                        <div className="lp-feat">
                            <div className="lp-feat-icon">📱</div>
                            <h3>Works Everywhere</h3>
                            <p>Desktop, tablet, or phone — your PDFs look great on any screen.</p>
                        </div>
                        <div className="lp-feat">
                            <div className="lp-feat-icon">🔒</div>
                            <h3>100% Private</h3>
                            <p>Files never leave your device. No uploads, no servers, no tracking.</p>
                        </div>
                    </div>
                </div>
            </section>

            {/* ── How It Works ── */}
            <section className="lp-how" id="how">
                <div className="lp-wrap">
                    <h2 className="lp-section-title">Three Steps. That's It.</h2>
                    <div className="lp-steps">
                        <div className="lp-step">
                            <span className="lp-step-num">1</span>
                            <h3>Drop Your File</h3>
                            <p>Drag a PDF onto the page or click "Open a PDF" to browse.</p>
                        </div>
                        <div className="lp-step-arrow" aria-hidden="true">→</div>
                        <div className="lp-step">
                            <span className="lp-step-num">2</span>
                            <h3>Start Reading</h3>
                            <p>Zoom, rotate, navigate — everything you need, nothing you don't.</p>
                        </div>
                        <div className="lp-step-arrow" aria-hidden="true">→</div>
                        <div className="lp-step">
                            <span className="lp-step-num">3</span>
                            <h3>Study Smarter</h3>
                            <p>Keyboard shortcuts, page thumbnails, and fullscreen for focus mode.</p>
                        </div>
                    </div>

                    <div className="lp-final-cta">
                        <button className="lp-cta lp-cta--wide" onClick={onStartLearning}>
                            Start Reading Now — It's Free
                        </button>
                    </div>
                </div>
            </section>

            {/* ── Footer ── */}
            <footer className="lp-footer">
                <div className="lp-wrap">
                    <p>skillTadka · Built for Students · Powered by PDF.js</p>
                </div>
            </footer>
        </div>
    );
}
