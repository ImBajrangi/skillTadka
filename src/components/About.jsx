import React from 'react';
import { Shield, Zap, Palette, ServerOff, Smartphone, Diamond } from 'lucide-react';

export default function About() {
    return (
        <div className="about-page fade-in">
            {/* Dynamic Immersive Hero */}
            <section className="about-hero bento-hero">
                <div className="hero-mesh"></div>
                <div className="aurora-orb orb-lavender" style={{ '--mx': '20%', '--my': '20%' }}></div>
                <div className="about-content">
                    <div className="status-pill floating">The Elyte Standard</div>
                    <h2 className="about-title outline-text">PADHLE<br /><span className="solid-text">STUDIO</span></h2>
                    <p className="about-subtitle">
                        A masterclass in digital focus. We've stripped away the noise to engineer
                        the world's most premium, private, and frictionless academic toolkit.
                    </p>
                </div>
            </section>

            <div className="about-container">
                {/* Bento Grid Layout */}
                <div className="bento-grid-master">

                    {/* Bento 1: Ultra Privacy (Large Square) */}
                    <div className="bento-card bento-privacy">
                        <div className="bento-glass-overlay"></div>
                        <div className="bento-icon-wrap glow-shield">
                            <Shield size={42} strokeWidth={1.5} />
                        </div>
                        <h3>Absolute Privacy</h3>
                        <p>
                            Designed on the principle of "Local-First" architecture.
                            Zero cloud telemetry. Zero unexpected uploads. Your study materials remain strictly on your machine.
                        </p>
                        <div className="bento-stats horizontal">
                            <div className="b-stat"><span>100%</span>Local</div>
                            <div className="b-stat"><span>0</span>Telemetry</div>
                        </div>
                    </div>

                    {/* Bento 2: Performance (Tall Rectangle) */}
                    <div className="bento-card bento-performance">
                        <div className="bento-glass-overlay"></div>
                        <div className="bento-icon-wrap text-gold">
                            <Zap size={36} strokeWidth={1.5} />
                        </div>
                        <h3>Engineered for Flow</h3>
                        <p>
                            Powered by an optimized rendering core, PadhLe eliminates the microscopic delays that break your concentration. Instant page turns, zero lag.
                        </p>
                        <div className="perf-bar-group">
                            <div className="perf-bar"><div className="fill" style={{ width: '98%' }}></div><span>Speed</span></div>
                            <div className="perf-bar"><div className="fill" style={{ width: '95%' }}></div><span>Clarity</span></div>
                        </div>
                    </div>

                    {/* Bento 3: Offline (Small Square) */}
                    <div className="bento-card bento-offline">
                        <ServerOff size={28} className="text-secondary mb-3" />
                        <h4>Unplug & Play</h4>
                        <p>Total functionality without an internet connection.</p>
                    </div>

                    {/* Bento 4: Aesthetics (Wide Rectangle) */}
                    <div className="bento-card bento-aesthetics">
                        <div className="bento-icon-wrap text-indigo">
                            <Palette size={32} />
                        </div>
                        <div className="aes-content">
                            <h3>Studio Detail</h3>
                            <p>
                                Every pixel is intentional. From multi-layered mesh gradients to physical glassmorphism,
                                the UI acts as a calm, focusing framing device for your knowledge.
                            </p>
                        </div>
                    </div>

                    {/* Bento 5: Responsive (Small Square) */}
                    <div className="bento-card bento-responsive">
                        <Smartphone size={28} className="text-secondary mb-3" />
                        <h4>Fluid UI</h4>
                        <p>Perfectly maps to desktop, tablet, and mobile paradigms.</p>
                    </div>
                </div>

                {/* Company Context / CTA */}
                <section className="company-info premium-cta">
                    <div className="company-logo float-slow">
                        <Diamond size={48} strokeWidth={1} />
                    </div>
                    <h4>A Vrindopnishad Masterpiece</h4>
                    <p>
                        We build tools that respect the student's intellect. No gimmicks, no superficial features—just raw, unfiltered performance wrapped in unprecedented elegance.
                    </p>
                    <button className="elite-btn primary shimmer-btn">Experience The Studio</button>
                </section>
            </div>
        </div>
    );
}
