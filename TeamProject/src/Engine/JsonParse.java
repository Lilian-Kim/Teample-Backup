package Engine;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class JsonParse {

	public static HashMap<Integer, ProductInfo> parse(String str) {
		HashMap<Integer, ProductInfo> searchInfo = new HashMap<Integer, ProductInfo>();
		ProductInfo pinfo = null;
		try {
			String encoding = URLEncoder.encode(str, "UTF-8");
			String str1 = "https://apis.daum.net/shopping/search?apikey=e0a62860cd57c16caafe1cd9e3cf00d4&q=" + encoding	+ "&result=10&pageno=1&output=json&sort=pop";
			URL url = new URL(str1);
			URLConnection uc = null;
			uc = url.openConnection();
			uc.connect();
			InputStream in = uc.getInputStream();
			Reader r = new InputStreamReader(in, "UTF-8");
			int c;
			StringBuilder sb = new StringBuilder();
			while ((c = r.read()) != -1) {
				sb.append((char) c);
			}
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(sb.toString());
			JSONObject resultjsonObject = (JSONObject) jsonObject.get("channel");
			JSONArray productInfoArray = (JSONArray) resultjsonObject.get("item");
			for (int i = 0; i < productInfoArray.size(); i++) {
				JSONObject productObject = (JSONObject) productInfoArray.get(i);
				String title = productObject.get("title").toString();
				String price_min = productObject.get("price_min").toString();
				String maker = productObject.get("maker").toString();
				String brand = productObject.get("brand").toString();
				String category_name = productObject.get("category_name").toString();
				String shoppingmall = productObject.get("shoppingmall").toString();
				String link = productObject.get("link").toString();
				String image_url = productObject.get("image_url").toString();
				pinfo = new ProductInfo(title, price_min, maker, brand, category_name, shoppingmall, link, image_url);
				searchInfo.put(i, pinfo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return searchInfo;
	}
}
