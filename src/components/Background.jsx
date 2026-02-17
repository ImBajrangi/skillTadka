import { useEffect, useRef } from 'react';

export default function Background() {
    const containerRef = useRef(null);

    useEffect(() => {
        const el = containerRef.current;
        if (!el) return;

        const w = window.innerWidth;
        const h = window.innerHeight;
        const count = Math.max(3, Math.floor(Math.min(w, h) / 250));
        const frag = document.createDocumentFragment();

        for (let c = 0; c < count; c++) {
            const pts = [];
            const cx = Math.random() * w;
            const cy = Math.random() * h;
            const n = 5 + Math.floor(Math.random() * 5);

            for (let i = 0; i < n; i++) {
                const dist = 50 + Math.random() * 150;
                const angle = Math.random() * Math.PI * 2;
                const x = cx + Math.cos(angle) * dist;
                const y = cy + Math.sin(angle) * dist;
                pts.push({ x, y });

                const star = document.createElement('div');
                star.className = 'constellation-star';
                const sz = 2 + Math.random() * 4;
                star.style.cssText = `left:${x}px;top:${y}px;width:${sz}px;height:${sz}px;animation-delay:${Math.random() * 3}s`;
                frag.appendChild(star);
            }

            // Connect nearby stars
            for (let i = 0; i < pts.length - 1; i++) {
                const dists = pts.map((p, j) => ({
                    j,
                    d: Math.hypot(p.x - pts[i].x, p.y - pts[i].y)
                })).filter(d => d.j !== i).sort((a, b) => a.d - b.d);

                const cc = 1 + Math.floor(Math.random() * 2);
                for (let k = 0; k < Math.min(cc, dists.length); k++) {
                    const p1 = pts[i], p2 = pts[dists[k].j];
                    const dist = Math.hypot(p2.x - p1.x, p2.y - p1.y);
                    const angle = Math.atan2(p2.y - p1.y, p2.x - p1.x);
                    const line = document.createElement('div');
                    line.className = 'constellation-line';
                    line.style.cssText = `width:${dist}px;height:2px;left:${p1.x}px;top:${p1.y}px;transform:rotate(${angle}rad);animation-delay:${Math.random() * 5}s`;
                    frag.appendChild(line);
                }
            }
        }
        el.appendChild(frag);
        return () => { el.innerHTML = ''; };
    }, []);

    return <div className="constellation-lines" ref={containerRef} />;
}
