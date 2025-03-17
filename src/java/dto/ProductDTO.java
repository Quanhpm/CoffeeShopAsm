package dto;

/**
 *
 * @author Admin
 */
public class ProductDTO {
    private int id;
    private String name;
    private float price;
    private DescriptionDTO description; 
    private int categoryId;
    private int toppingId;
    private String image;  // Đổi tên thành image

    // Constructors
    public ProductDTO() {
    }

    public ProductDTO(int id, String name, float price, DescriptionDTO description, int categoryId, int toppingId, String image) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.categoryId = categoryId;
        this.toppingId = toppingId;
        this.image = image;  // Khởi tạo image
    }

    // Getter and Setter methods
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public DescriptionDTO getDescription() {
        return description;
    }

    public void setDescription(DescriptionDTO description) {
        this.description = description;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getToppingId() {
        return toppingId;
    }

    public void setToppingId(int toppingId) {
        this.toppingId = toppingId;
    }

    public String getImage() {
        return image;  // Getter for image
    }

    public void setImage(String image) {
        this.image = image;  // Setter for image
    }

    @Override
    public String toString() {
        return "ProductDTO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", description=" + description +
                ", categoryId=" + categoryId +
                ", toppingId=" + toppingId +
                ", image='" + image + '\'' +  // Cập nhật toString
                '}';
    }
}
