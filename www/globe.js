// --- WIREFRAME GLOBE ---
const gc = document.getElementById("globe-canvas");
const gCtx = gc.getContext("2d");

let sphere = { points: [], rotation: 0 };
const radius = 250;
const numPoints = 600;

function resizeGlobe() {
    gc.width = window.innerWidth;
    gc.height = window.innerHeight;
    initGlobe();
}

/**
 * Initializes the 3D sphere points using a Fibonacci Sphere algorithm.
 * This ensures an even distribution of points on the sphere surface.
 */
function initGlobe() {
    sphere.points = [];
    for (let i = 0; i < numPoints; i++) {
        // Fibonacci Sphere Algorithm for even distribution
        const y = 1 - (i / (numPoints - 1)) * 2;
        const radiusAtY = Math.sqrt(1 - y * y);
        const theta = i * 2.39996; // Golden angle increment

        const x = Math.cos(theta) * radiusAtY;
        const z = Math.sin(theta) * radiusAtY;
        sphere.points.push({x: x * radius, y: y * radius, z: z * radius});
    }
}

/**
 * Renders the rotating wireframe globe.
 * Applies 3D rotation math and simple perspective projection.
 */
function drawGlobe() {
    gCtx.clearRect(0, 0, gc.width, gc.height);
    const cx = gc.width / 2;
    const cy = gc.height / 2;

    sphere.rotation += 0.005;

    gCtx.fillStyle = "#00ff00";

    sphere.points.forEach(p => {
        // Rotate around Y axis
        const rx = p.x * Math.cos(sphere.rotation) - p.z * Math.sin(sphere.rotation);
        const rz = p.x * Math.sin(sphere.rotation) + p.z * Math.cos(sphere.rotation);

        // Simple perspective
        const scale = 400 / (400 - rz);
        const x2d = rx * scale + cx;
        const y2d = p.y * scale + cy;
        const size = 1.5 * scale;

        if(scale > 0) { // Only draw front points
            gCtx.globalAlpha = Math.max(0.1, (scale - 0.5)); // Fade back points
            gCtx.beginPath();
            gCtx.arc(x2d, y2d, size, 0, Math.PI * 2);
            gCtx.fill();
        }
    });
    requestAnimationFrame(drawGlobe);
}

// Initial setup and event listener
window.addEventListener('resize', resizeGlobe);
initGlobe();
drawGlobe();
