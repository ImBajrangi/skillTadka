export default function Loader({ visible }) {
    if (!visible) return null;
    return (
        <div className="loader active">
            <div className="loader-content">
                <div className="spinner" />
                <div className="loader-text">Loading PDF...</div>
            </div>
        </div>
    );
}
