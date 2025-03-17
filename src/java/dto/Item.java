package dto;

public class Item {
    private ProductDTO product;
    private int quantity;
    
    public Item(ProductDTO product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }
    
    public int getId() {
        return product.getId();
    }
    
    public ProductDTO getProduct() {
        return product;
    }
    
    public void setProduct(ProductDTO product) {
        this.product = product;
    }
    
    public int getQuantity() {
        return quantity;
    }
    
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public double getCost() {
        return product.getPrice() * quantity;
    }
    
    @Override
    public String toString() {
        return "Item{" + "product=" + product + ", quantity=" + quantity + '}';
    }
}