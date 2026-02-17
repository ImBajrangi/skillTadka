export default function ErrorModal({ message, onClose }) {
    if (!message) return null;
    return (
        <div className="modal show">
            <div className="modal-content">
                <div className="modal-header">
                    <h3>Error</h3>
                    <button className="icon-btn" onClick={onClose}>
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><line x1="18" y1="6" x2="6" y2="18" /><line x1="6" y1="6" x2="18" y2="18" /></svg>
                    </button>
                </div>
                <div className="modal-body">
                    <p>{message}</p>
                </div>
                <div className="modal-footer">
                    <button className="primary-btn" onClick={onClose}>OK</button>
                </div>
            </div>
        </div>
    );
}
