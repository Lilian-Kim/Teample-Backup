package Engine;

public class ProductInfo {

	String title = null;
	String price_min = null;
	String maker = null;
	String brand = null;
	String category_name = null;
	String shoppingmall = null;
	String link = null;
	String image_url = null;

	public ProductInfo(String title, String price_min, String maker, String brand, String category_name, String shoppingmall, String link, String image_url) {
		this.title = title;
		this.price_min = price_min;
		this.maker = maker;
		this.brand = brand;
		this.category_name = category_name;
		this.shoppingmall = shoppingmall;
		this.link = link;
		this.image_url = image_url;
	}

	public String getTitle() {
		return title;
	}

	public String getPrice_min() {
		return price_min;
	}

	public String getMaker() {
		return maker;
	}

	public String getBrand() {
		return brand;
	}

	public String getCategory_name() {
		return category_name;
	}

	public String getShoppingmall() {
		return shoppingmall;
	}

	public String getLink() {
		return link;
	}

	public String getImage_url() {
		return image_url;
	}
}