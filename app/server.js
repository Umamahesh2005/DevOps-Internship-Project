const express = require("express");
const path = require("path");

const app = express();
const PORT = 3000;

// Serve static files (CSS)
app.use(express.static(path.join(__dirname, "public")));

// Home Page
app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "views", "home.html"));
});

// About Page
app.get("/about", (req, res) => {
    res.sendFile(path.join(__dirname, "views", "about.html"));
});

// Contact Page
app.get("/contact", (req, res) => {
    res.sendFile(path.join(__dirname, "views", "contact.html"));
});

// Health Check API
app.get("/health", (req, res) => {
    res.json({
        status: "OK",
        message: "Application is running successfully!"
    });
});

// Start Server
app.listen(PORT, () => {
    console.log(`Server is running at http://localhost:${PORT}`);
});