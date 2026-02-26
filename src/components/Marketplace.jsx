export default function Marketplace({ onOpenReader }) {
    const categories = [
        { id: 'books', name: 'Textbooks', icon: '📚', count: '1.2k+', color: '#4F46E5' },
        { id: 'notes', name: 'Premium Notes', icon: '📝', count: '850+', color: '#FACC15' },
        { id: 'courses', name: 'Masterclasses', icon: '🎓', count: '120+', color: '#10B981' },
        { id: 'gear', name: 'Study Gear', icon: '🎧', count: '340+', color: '#EC4899' },
    ];

    const products = [
        { id: 1, name: 'Advanced Calculus Kit', price: '₹499', author: 'Dr. Verma', rating: 4.8, image: 'https://images.unsplash.com/photo-1543004629-142a76d50c9e?auto=format&fit=crop&q=80&w=400' },
        { id: 2, name: 'Digital Notes: Modern Hist', price: '₹149', author: 'Ankit Raj', rating: 4.9, image: 'https://images.unsplash.com/photo-1517842645767-c639042777db?auto=format&fit=crop&q=80&w=400' },
        { id: 3, name: 'Organic Chemistry Vol 1', price: '₹799', author: 'Pearson', rating: 4.7, image: 'https://images.unsplash.com/photo-1532012197267-da84d127e765?auto=format&fit=crop&q=80&w=400' },
        { id: 4, name: 'JEE Physics Cheatsheet', price: '₹99', author: 'Kota Scholars', rating: 5.0, image: 'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?auto=format&fit=crop&q=80&w=400' },
    ];

    return (
        <div className="marketplace-fade-in">
            {/* Promo Banner */}
            <section className="promo-banner">
                <div className="promo-content">
                    <span className="badge">New Arrival</span>
                    <h2>Premium Exam Kits 2025</h2>
                    <p>Curated by top educators to help you ace your semi-finals.</p>
                    <button className="secondary-btn">Explore Kits</button>
                </div>
                <div className="promo-visual">
                    <div className="aura-orb yellow-orb"></div>
                </div>
            </section>

            {/* Categories Grid */}
            <section className="category-section">
                <div className="section-header">
                    <h3>Explore Categories</h3>
                    <button className="text-link">View All</button>
                </div>
                <div className="bento-categories">
                    {categories.map(cat => (
                        <div key={cat.id} className="bento-item" style={{ '--accent-color': cat.color }}>
                            <span className="cat-icon">{cat.icon}</span>
                            <div className="cat-info">
                                <h4>{cat.name}</h4>
                                <span>{cat.count} items</span>
                            </div>
                        </div>
                    ))}
                </div>
            </section>

            {/* Featured Feed */}
            <section className="product-feed">
                <div className="section-header">
                    <h3>Top Study Materials</h3>
                    <div className="feed-filters">
                        <button className="filter-chip active">All</button>
                        <button className="filter-chip">Free</button>
                        <button className="filter-chip">Premium</button>
                    </div>
                </div>
                <div className="product-grid">
                    {products.map(product => (
                        <div key={product.id} className="product-card">
                            <div className="product-image">
                                <img src={product.image} alt={product.name} />
                                <div className="overlay-actions">
                                    <button className="action-circle" onClick={onOpenReader} title="Preview PDF">
                                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z" /><circle cx="12" cy="12" r="3" /></svg>
                                    </button>
                                </div>
                            </div>
                            <div className="product-details">
                                <div className="product-meta">
                                    <span className="product-rating">⭐ {product.rating}</span>
                                    <span className="product-author">{product.author}</span>
                                </div>
                                <h4>{product.name}</h4>
                                <div className="product-footer">
                                    <span className="price">{product.price}</span>
                                    <button className="buy-btn">Buy Now</button>
                                </div>
                            </div>
                        </div>
                    ))}
                </div>
            </section>

            {/* Sticky Reader Invite */}
            <div className="reader-invite">
                <div className="invite-content">
                    <h4>Have your own notes?</h4>
                    <p>Read, annotate, and organize them in our professional viewer.</p>
                </div>
                <button className="primary-btn yellow-btn" style={{ gap: '0.6rem' }} onClick={onOpenReader}>
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20" /><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z" /></svg>
                    <span>Open Reader</span>
                </button>
            </div>
        </div>
    );
}
