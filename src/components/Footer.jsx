import React from 'react';

export default function Footer() {
    return (
        <footer className="elite-footer">
            <div className="footer-mesh"></div>
            <div className="footer-content">
                <div className="footer-main">
                    <div className="footer-brand">
                        <div className="logo">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20" />
                                <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z" />
                            </svg>
                            <h2 className="logo-text">PADH<span>LE</span></h2>
                        </div>
                        <p className="brand-tagline">The world's most refined study experience.</p>
                    </div>

                    <div className="footer-links">
                        <div className="link-group">
                            <h4>Studio</h4>
                            <a href="#">Marketplace</a>
                            <a href="#">Premium Kits</a>
                            <a href="#">Author Program</a>
                        </div>
                        <div className="link-group">
                            <h4>Resources</h4>
                            <a href="#">Documentation</a>
                            <a href="#">Help Center</a>
                            <a href="#">Release Notes</a>
                        </div>
                        <div className="link-group">
                            <h4>Company</h4>
                            <a href="#">About PadhLe</a>
                            <a href="#">Privacy Policy</a>
                            <a href="#">Terms of Service</a>
                        </div>
                    </div>
                </div>

                <div className="footer-bottom">
                    <div className="copyright">
                        © 2025 Vrindopnishad. PadhLe Studio Edition.
                    </div>
                    <div className="social-links">
                        <a href="#" aria-label="Twitter">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z" /></svg>
                        </a>
                        <a href="#" aria-label="GitHub">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22" /></svg>
                        </a>
                        <a href="#" aria-label="LinkedIn">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z" /><rect x="2" y="9" width="4" height="12" /><circle cx="4" cy="4" r="2" /></svg>
                        </a>
                    </div>
                </div>
            </div>
        </footer>
    );
}
