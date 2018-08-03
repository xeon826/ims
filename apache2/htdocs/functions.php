<?php
class Mysql
{
    private $sql;
    private $query;
    public function __construct()
    {
        $this->sql = new mysqli('localhost', 'root', 'Gdadg13531', 'ivm');
        if ($this->sql->connect_error) {
            die("Connection failed: " . $this->sql->connect_error);
        }
    }
    public function add_new_product()
    {
        // prodName: $('.product-create prodname').val(),
        // starting: $('.product-create startingInventory').val(),
        // minimum: $('.product-create minimumRequired').val(),
        $prodName= (isset($_POST['prodName'])) ? $_POST['prodName'] : 3;
        $starting= (isset($_POST['starting'])) ? $_POST['starting'] : 3;
        $minimum= (isset($_POST['minimum'])) ? $_POST['minimum'] : 3;
        $queryText = "insert into products (ProductName, StartingInventory, MinimumRequired)
        VALUES ('$prodName', $starting, $minimum)";
        $query= $this->sql->query($queryText);
          $this->sql->close();
    }
    public function add_purchase()
    {
        $queryText = "SELECT * FROM products";
        $query= $this->sql->query($queryText);
        if ($query->num_rows > 0) {
            // echo view('current_inv', 'open');
            echo '<option>Select a product:</option>';
            while ($row = $query->fetch_assoc()) {
                echo '
         <option>'.$row["ProductName"].'</option>
         ';
            }
            // echo view('current_inv', 'close');
        } else {
            echo "0 results";
        }
        $this->sql->close();
    }
    public function prod_dropdown()
    {
        $queryText = "SELECT * FROM products";
        $query= $this->sql->query($queryText);
        if ($query->num_rows > 0) {
            // echo view('current_inv', 'open');
            echo '<option>Select a product:</option>';
            while ($row = $query->fetch_assoc()) {
                echo '
         <option>'.$row["ProductName"].'</option>
         ';
            }
            // echo view('current_inv', 'close');
        } else {
            echo "0 results";
        }
        $this->sql->close();
    }
    public function get_current_inv()
    {
        $queryText = 'SELECT p.id, isnull(ig.NumReceived,0), og.NumShipped,
        coalesce((p.StartingInventory-og.NumShipped+ig.NumReceived), p.StartingInventory)
        as OnHand, p.ProductName,
        p.StartingInventory, p.MinimumRequired
        from products p
        left outer join (
            select productid, sum(NumReceived) as NumReceived
            from incoming
            group by productid
        ) as ig on p.id = ig.productid
        left outer join (
            select productid, sum(NumberShipped) as NumShipped
            from outgoing
            group by productid
        ) as og on p.id = og.productid';
        // $queryText = "SELECT * FROM products limit 10 offset 0";
        $query= $this->sql->query($queryText);
        if ($query->num_rows > 0) {
            echo view('current_inv', 'open');
            while ($row = $query->fetch_assoc()) {
                echo '
                <tr>
         <td>'.$row["ProductName"].'</td>
         <td>'.$row["StartingInventory"].'</td>
         <td>'. $row["NumShipped"].'</td>
         <td>'.$row["NumReceived"].'</td>
         <td>'.$row["OnHand"].'</td>
         <td>'.$row["MinimumRequired"].'</td>
         </tr>
         ';
            }
            echo view('current_inv', 'close');
        } else {
            echo "0 results";
        }
        $this->sql->close();
    }
    public function get_incoming()
    {
        // purchase date, product name, number received, supplier name
        // $queryText = "SELECT * FROM incoming limit 10 offset 0";
        $queryText = "SELECT incoming.PurchaseDate, products.ProductName, incoming.NumReceived, vendors.supplier
        FROM incoming, vendors, products
        WHERE vendors.id = incoming.SupplierId and incoming.ProductId = products.id limit 10";
        $query = $this->sql->query($queryText);
        if ($query->num_rows > 0) {
            echo view('incoming', 'open');
            while ($row = $query->fetch_assoc()) {
                echo '
                <tr>
         <td>'.$row["PurchaseDate"].'</td>
         <td>'.$row["ProductName"].'</td>
         <td>'.$row["NumReceived"].'</td>
         <td>'. $row["supplier"].'</td>
         </tr>
         ';
            }
            echo view('incoming', 'close');
        } else {
            echo "0 results";
        }
        $this->sql->close();
    }
    public function get_outgoing()
    {
        $queryText = "SELECT * FROM outgoing limit 10 offset 0";
        $query = $this->sql->query($queryText);
        if ($query->num_rows > 0) {
            echo view('outgoing', 'open');
            while ($row = $query->fetch_assoc()) {
                echo '
                <tr>
         <td>'.$row["First"].'</td>
         <td>'.$row["Middle"].'</td>
         <td>'.$row["Last"].'</td>
         <td>'. $row["ProductId"].'</td>
         <td>'.$row["NumberShipped"].'</td>
         <td>'.$row["OrderDate"].'</td>
         </tr>
         ';
            }
            echo view('outgoing', 'close');
        } else {
            echo "0 results";
        }
        $this->sql->close();
    }


    public function get_archive($table, $name, $page)
    {
        $page--;
        $page *= 9;
        // return "SELECT * FROM $table where Productname like '%$name%' limit 10 offset $page";
        // $this->$mysql = new mysqli($servername, $username, $password, $dbname);
        return "SELECT * FROM $table limit 10 offset $page";
    }
    public function num_shipped($pid)
    {
        return "SELECT SUM(NumberShipped) FROM outgoing WHERE ProductId = $pid";
    }
}
$action= (isset($_POST['action'])) ? $_POST['action'] : 3;
$object = new Mysql();
switch ($action) {
  // case 'get_current_inv': get_current_inv();
  case 'get_current_inv': $object->get_current_inv();
  break;
  case 'get_outgoing': $object->get_outgoing();
  break;
  case 'get_incoming': $object->get_incoming();
  break;
  case 'prod_dropdown': $object->prod_dropdown();
  break;
  case 'add_new_product': $object->add_new_product();
  break;
}

function view($view, $operate)
{
    if ($operate=='close') {
        return '</tbody>';
    }
    switch ($view) {
    case 'current_inv':
      return '
      <thead>
        <tr>
            <th>Name</th>
            <th>Current Inventory</th>
            <th>Shipped</th>
            <th>Incoming</th>
            <th>On Hand</th>
            <th>Minimum Required</th>
        </tr>
        </thead>
        <tbody>
        ';
      case 'incoming':
        return '
        <thead>
        <tr>
            <th>Purchase Date</th>
            <th>Product Name</th>
            <th>Number Received</th>
            <th>Supplier</th>
        </tr>
        </thead>
        <tbody>
          ';
      case 'outgoing':
        return '
        <thead>
        <tr>
            <th>First Name</th>
            <th>Middle Name</th>
            <th>Last Name</th>
            <th>Product ID</th>
            <th>Number Shipped</th>
            <th>Order Date</th>
        </tr>
        </thead>
        <tbody>
              ';
    }
}
