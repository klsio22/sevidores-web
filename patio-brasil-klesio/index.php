<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Shopping Home</title>
</head>
<body>

    <header>
        <h1>Shopping Home</h1>
    </header>

    <section class="products">
        <?php
            // Simulando uma lista de produtos do banco de dados
            $products = [
                ['id' => 1, 'name' => 'Product 1', 'price' => 19.99],
                ['id' => 2, 'name' => 'Product 2', 'price' => 29.99],
                ['id' => 3, 'name' => 'Product 3', 'price' => 39.99],
            ];

            foreach ($products as $product) {
                echo "<div class='product'>";
                echo "<h2>{$product['name']}</h2>";
                echo "<p>Price: $" . number_format($product['price'], 2) . "</p>";
                echo "<a href='checkout.php?id={$product['id']}'>Add to Cart</a>";
                echo "</div>";
            }
        ?>
    </section>

    <footer>
        <p>&copy; 2023 Shopping Home</p>
    </footer>

</body>
</html>
