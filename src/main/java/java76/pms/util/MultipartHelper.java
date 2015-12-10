package java76.pms.util;

import java.io.IOException;

import net.coobird.thumbnailator.Thumbnails;

public class MultipartHelper {

  public static String generateFilename(String originFilename) {
    int dotPos = originFilename.lastIndexOf(".");
    String ext = "";
    if (dotPos != -1) {
      ext = originFilename.substring(dotPos);
    }

    return String.format("file-%d-%d%s", System.currentTimeMillis(), count(), ext);
  }
  

  static int count = 0;

  synchronized private static int count() {
    if (count > 10000) {
      count = 0;
    }
    return ++count;
  }

  public static void makeThumbImg(String filename, String saveDir) throws IOException {
    Thumbnails.of(saveDir + "/" + filename).size(60, 60).toFile(saveDir + "/s-" + filename);
  }
}
