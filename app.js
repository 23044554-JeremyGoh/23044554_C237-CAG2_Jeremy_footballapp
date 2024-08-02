// Import the express module
const express = require('express');

// Import the mysql2 module for MySQL database interaction
const mysql = require('mysql2');

// Import the multer module for handling file uploads
const multer = require('multer');
const path = require('path');

// Create an instance of the express application
const app = express();

// Set up multer for file uploads
const storage = multer.diskStorage({
    // Define the destination directory for uploaded files
    destination: (req, file, cb) => {
        cb(null, 'public/images'); // Directory to save uploaded files
    },
    // Define the filename for uploaded files
    filename: (req, file, cb) => {
        cb(null, file.originalname); // Use the original file name
    }
});

// Create an upload instance with the defined storage settings
const upload = multer({ storage: storage });

// Create MySQL connection
const connection = mysql.createConnection({
    host: 'mysql-jeremygoh.alwaysdata.net', // Database host
    user: 'jeremygoh', // Database user
    password: 'Ilovecpu@123', // Database password
    database: 'jeremygoh_project' // Database name
});

// Connect to the MySQL database
connection.connect((err) => {
    if (err) {
        console.error('Error connecting to MySQL:', err); // Log error if connection fails
        return;
    }
    console.log('Connected to MySQL database'); // Log success message if connection is successful
});

// Set up view engine to use EJS templates
app.set('view engine', 'ejs');

// Enable serving of static files from the 'public' directory
app.use(express.static('public'));

// Enable form processing with URL-encoded data
app.use(express.urlencoded({
    extended: false
}));

// Define routes

// Route for the homepage
app.get('/', (req, res) => {
    res.render('homepage'); // Render the 'homepage' template
});

// Route to display all products
app.get('/products', (req, res) => {
    const sql = 'SELECT * FROM products'; // SQL query to select all products
    // Fetch data from MySQL
    connection.query(sql, (error, results) => {
        if (error) {
            console.error('Database query error:', error.message); // Log error if query fails
            return res.status(500).send('Error Retrieving Products'); // Send error response
        }
        // Render 'products' template with the fetched data
        res.render('products', { products: results });
    });
});

// Route to display a single product by ID
app.get('/product/:id', (req, res) => {
    const id = req.params.id; // Extract the product ID from the request parameters
    const sql = 'SELECT * FROM products WHERE id = ?'; // SQL query to select product by ID
    // Fetch data from MySQL based on the product ID
    connection.query(sql, [id], (error, results) => {
        if (error) {
            console.error('Database query error:', error.message); // Log error if query fails
            return res.status(500).send('Error Retrieving product by ID'); // Send error response
        }
        // Check if any product with the given ID was found
        if (results.length > 0) {
            // Render 'product' template with the fetched data
            res.render('product', { product: results[0] });
        } else {
            // If no product with the given ID was found, send a 404 response
            res.status(404).send('Product not found');
        }
    });
});

// Route to display the add product form
app.get('/addProduct', (req, res) => {
    res.render('addProduct'); // Render the 'addProduct' template
});

// Route to handle the submission of the add product form
app.post('/addProduct', upload.single('image'), (req, res) => {
    const { name, description, price } = req.body; // Extract product data from the request body
    let image;
    if (req.file) {
        image = req.file.filename; // Save only the filename if an image was uploaded
    } else {
        image = null; // Set image to null if no image was uploaded
    }
    const sql = 'INSERT INTO products (name, description, price, image) VALUES (?, ?, ?, ?)'; // SQL query to insert a new product
    // Insert the new product into the database
    connection.query(sql, [name, description, price, image], (error, results) => {
        if (error) {
            console.error("Error adding products:", error); // Log error if query fails
            res.status(500).send('Error adding product'); // Send error response
        } else {
            res.redirect('/products'); // Redirect to the products page on success
        }
    });
});

// Route to display the edit product form
app.get('/editProduct/:id', (req, res) => {
    const id = req.params.id; // Extract the product ID from the request parameters
    const sql = 'SELECT * FROM products WHERE id = ?'; // SQL query to select product by ID
    // Fetch data from MySQL based on the product ID
    connection.query(sql, [id], (error, results) => {
        if (error) {
            console.error('Database query error:', error.message); // Log error if query fails
            return res.status(500).send('Error Retrieving product by ID'); // Send error response
        }
        // Check if any product with the given ID was found
        if (results.length > 0) {
            // Render 'editProduct' template with the fetched data
            res.render('editProduct', { product: results[0] });
        } else {
            // If no product with the given ID was found, send a 404 response
            res.status(404).send('Product not found');
        }
    });
});

// Route to handle the submission of the edit product form
app.post('/editProduct/:id', upload.single('image'), (req, res) => {
    const id = req.params.id; // Extract the product ID from the request parameters
    const { name, description, price } = req.body; // Extract product data from the request body
    let image = req.body.currentImage; // Retrieve current image filename

    if (req.file) { // If a new image is uploaded
        image = req.file.filename; // Set image to the new image filename
    }

    const sql = 'UPDATE products SET name = ?, description = ?, price = ?, image = ? WHERE id = ?'; // SQL query to update the product

    // Update the product in the database
    connection.query(sql, [name, description, price, image, id], (error, results) => {
        if (error) {
            console.error("Error updating product:", error); // Log error if query fails
            res.status(500).send('Error updating product'); // Send error response
        } else {
            res.redirect('/products'); // Redirect to the products page on success
        }
    });
});

// Route to handle the deletion of a product
app.get('/deleteProduct/:id', (req, res) => {
    const id = req.params.id; // Extract the product ID from the request parameters
    const sql = 'DELETE from products WHERE id = ?'; // SQL query to delete the product

    // Delete the product from the database
    connection.query(sql, [id], (error, results) => {
        if (error) {
            console.error("Error deleting product:", error); // Log error if query fails
            res.status(500).send('Error deleting product'); // Send error response
        } else {
            res.redirect('/products'); // Redirect to the products page on success
        }
    });
});

// Define the port for the server to listen on
const PORT = process.env.PORT || 3000;

// Start the server and listen on the defined port
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
