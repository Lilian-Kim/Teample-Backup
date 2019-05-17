package Engine;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;

import com.mortennobel.imagescaling.AdvancedResizeOp;
import com.mortennobel.imagescaling.ResampleOp;

public class Thumbnail {

	/**
	 * 
	 * @param loadFile
	 *            원본파일 저장경로 및 파일명
	 * @param saveFile
	 *            저장할 경로및 파일명
	 * @param zoom
	 *            축소 비율
	 * @throws IOException
	 */
	public static void createThumbnailImage(String loadFile, String saveFile, int zoom) throws IOException {
		File save = new File(saveFile);
		RenderedOp rOp = JAI.create("fileload", loadFile);
		BufferedImage im = rOp.getAsBufferedImage();
		if (zoom <= 0) {
			zoom = 1;
		}
		int width = im.getWidth() / zoom;
		int height = im.getHeight() / zoom;
		BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2 = thumb.createGraphics();
		g2.drawImage(im, 0, 0, width, height, null);
		ImageIO.write(thumb, "jpg", save);
	}

	/**
	 * 
	 * @param loadFile
	 *            원본파일 저장경로 및 파일명
	 * @param saveFile
	 *            저장할 경로및 파일명
	 * @param width
	 * @param height
	 * @throws IOException
	 */
	public static void createImage(String loadFile, String saveFile, int width, int height) throws IOException {
		File save = new File(saveFile);
		RenderedOp rOp = JAI.create("fileload", loadFile);
		BufferedImage im = rOp.getAsBufferedImage();
		if (width <= 0) {
			width = 1;
		}
		if (height <= 0) {
			height = 1;
		}
		BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2 = thumb.createGraphics();
		g2.drawImage(im, 0, 0, width, height, null);
		ImageIO.write(thumb, "jpg", save);
	}

	/**
	 * 썸네일 이미지 개선 버전
	 * 
	 * @param loadFile
	 *            원본파일 저장경로 및 파일명 저장할 경로및 파일명
	 * @param saveFile
	 *            저장할 경로및 파일명
	 * @param width
	 * @param height
	 * @return
	 */
	public static void createImageThumbnail(String loadFile, String saveFile, int width, int height) {
		try {
			BufferedImage buffImage = ImageIO.read(new File(loadFile));
			ResampleOp resampleOp = new ResampleOp(width, height);
			resampleOp.setUnsharpenMask(AdvancedResizeOp.UnsharpenMask.Soft);
			BufferedImage rescaledImage = resampleOp.filter(buffImage, null);
			File destFile = new File(saveFile);
			ImageIO.write(rescaledImage, "png", destFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}