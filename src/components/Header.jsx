import { useState } from 'react';

export default function Header({ fileName, isDark, toggleTheme, onOpenFile, currentView, setView }) {
    const [isSearchOpen, setIsSearchOpen] = useState(false);
    return (
        <header className="app-header">
            <div className="header-container-inner">
                <div className="header-left">
                    <div className="logo" onClick={() => setView('landing')} style={{ cursor: 'pointer' }}>
                        <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20" />
                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z" />
                        </svg>
                        <h1 className="logo-text">PADH<span>LE</span></h1>
                    </div>

                    <nav className="header-tabs">
                        <button
                            className={`tab-btn ${currentView === 'marketplace' ? 'active' : ''}`}
                            onClick={() => setView('marketplace')}
                        >
                            Shop
                        </button>
                        <button
                            className={`tab-btn ${currentView === 'viewer' ? 'active' : ''}`}
                            onClick={() => setView('viewer')}
                        >
                            Reader
                        </button>
                        <button
                            className={`tab-btn ${currentView === 'about' ? 'active' : ''}`}
                            onClick={() => setView('about')}
                        >
                            Info
                        </button>
                    </nav>
                </div>

                <div className="header-center">
                    <div className="search-bar">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><circle cx="11" cy="11" r="8" /><line x1="21" y1="21" x2="16.65" y2="16.65" /></svg>
                        <input type="text" placeholder="Search resources..." />
                    </div>
                </div>

                <div className="header-right">
                    <div className="header-actions">
                        <button
                            className="icon-btn mobile-search-toggle"
                            onClick={() => setIsSearchOpen(!isSearchOpen)}
                            aria-label="Toggle Search"
                        >
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><circle cx="11" cy="11" r="8" /><line x1="21" y1="21" x2="16.65" y2="16.65" /></svg>
                        </button>
                        <button className="icon-btn" aria-label="Cart">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><circle cx="9" cy="21" r="1" /><circle cx="20" cy="21" r="1" /><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6" /></svg>
                        </button>
                        <button className="icon-btn" aria-label="Profile">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" /><circle cx="12" cy="7" r="4" /></svg>
                        </button>
                    </div>
                    <div className="divider"></div>
                    <button
                        className="icon-btn theme-toggle"
                        onClick={toggleTheme}
                        aria-label="Toggle theme"
                    >
                        {isDark ? (
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><circle cx="12" cy="12" r="5" /><line x1="12" y1="21" x2="12" y2="23" /><line x1="4.22" y1="4.22" x2="5.64" y2="5.64" /><line x1="18.36" y1="18.36" x2="19.78" y2="19.78" /><line x1="1" y1="12" x2="3" y2="12" /><line x1="21" y1="12" x2="23" y2="12" /><line x1="4.22" y1="19.78" x2="5.64" y2="18.36" /><line x1="18.36" y1="5.64" x2="19.78" y2="4.22" /></svg>
                        ) : (
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z" /></svg>
                        )}
                    </button>
                </div>
            </div>

            {/* Mobile Search Overlay */}
            <div className={`mobile-search-overlay ${isSearchOpen ? 'active' : ''}`}>
                <div className="mobile-search-container">
                    <div className="search-bar">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><circle cx="11" cy="11" r="8" /><line x1="21" y1="21" x2="16.65" y2="16.65" /></svg>
                        <input type="text" placeholder="Search resources..." autoFocus={isSearchOpen} />
                    </div>
                    <button className="icon-btn" onClick={() => setIsSearchOpen(false)}>
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><line x1="18" y1="6" x2="6" y2="18" /><line x1="6" y1="6" x2="18" y2="18" /></svg>
                    </button>
                </div>
            </div>
        </header>
    );
}
