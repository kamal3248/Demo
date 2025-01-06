package com;

import java.awt.Color;
import java.awt.FontMetrics;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Random;

import javax.imageio.ImageIO;


public class Test {
	public static String captchaValue = "";
	public static void main(String[] args) {
		//System.out.println(generateOTP());
		System.out.println(sendSMS2("9550707358", generateOTP()));
		//populateCaptcha();
	}
	public static String generateOTP(){
		String val = "";      
		Random r = new Random();
		int numbers = 100000 + (int)(r.nextFloat() * 899900);
		val += String.valueOf(numbers);
		return val;
	}
	public static void populateCaptcha( )  {
	    //@@begin populateCaptcha()
		  /*try{
			  new File("/bills/captchas/"+wdContext.currentContextElement().getCaptchaValue()+".jpg").delete();
		  }catch(Exception e){
			  
		  }*/
		  
		  try{
			  BufferedImage captchaImg = buildCaptcha();
			  String captchaStr = captchaValue;
			  String srcCaptcha = captchaStr+".jpg";
			  
			  ImageIO.write(captchaImg, "jpg", new File(srcCaptcha));
			  
			  //wdContext.currentContextElement().setCaptchaURL("/irj/go/km/docs/"+srcCaptcha);
			  
			  
		  }catch(Exception e){
			 e.printStackTrace();
		  }
	    //@@end
	  }

	
	  public static BufferedImage  buildCaptcha( )  {
	    //@@begin buildCaptcha()
		  
		  try {
	          Color backgroundColor = Color.white;
	          Color borderColor = Color.black;
	          Color textColor = Color.black;
	          Color circleColor = new Color(190, 160, 150);
	          java.awt.Font textFont = new java.awt.Font("Verdana", java.awt.Font.BOLD, 20);
	          int charsToPrint = 6;
	          int width = 160;
	          int height = 50;
	          int circlesToDraw = 25;
	          float horizMargin = 10.0f;
	          double rotationRange = 0.7; 
	          BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	          Graphics2D g = (Graphics2D) bufferedImage.getGraphics();
	          g.setColor(backgroundColor);
	          g.fillRect(0, 0, width, height);

	          // lets make some noisey circles
	          g.setColor(circleColor);
	          for (int i = 0; i < circlesToDraw; i++) {
	              int L = (int) (Math.random() * height / 2.0);
	              int X = (int) (Math.random() * width - L);
	              int Y = (int) (Math.random() * height - L);
	              g.draw3DRect(X, Y, L * 2, L * 2, true);
	          }
	          g.setColor(textColor);
	          g.setFont(textFont);
	          FontMetrics fontMetrics = g.getFontMetrics();
	          int maxAdvance = fontMetrics.getMaxAdvance();
	          int fontHeight = fontMetrics.getHeight();


	          String elegibleChars = "ABCDEFGHJKLMNPQRSTUVWXYabcdefghjkmnpqrstuvwxy23456789";
	          //String elegibleChars = "123456789";
	          char[] chars = elegibleChars.toCharArray();
	          float spaceForLetters = -horizMargin * 2 + width;
	          float spacePerChar = spaceForLetters / (charsToPrint - 1.0f);
	          StringBuffer finalString = new StringBuffer();
	          for (int i = 0; i < charsToPrint; i++) {
	              double randomValue = Math.random();
	              int randomIndex = (int) Math.round(randomValue * (chars.length - 1));
	              char characterToShow = chars[randomIndex];
	              finalString.append(characterToShow);
	              int charWidth = fontMetrics.charWidth(characterToShow);
	              int charDim = Math.max(maxAdvance, fontHeight);
	              int halfCharDim = (int) (charDim / 2);
	              BufferedImage charImage = new BufferedImage(charDim, charDim, BufferedImage.TYPE_INT_ARGB);
	              Graphics2D charGraphics = charImage.createGraphics();
	              charGraphics.translate(halfCharDim, halfCharDim);
	              double angle = (Math.random() - 0.5) * rotationRange;
	              charGraphics.transform(AffineTransform.getRotateInstance(angle));
	              charGraphics.translate(-halfCharDim, -halfCharDim);
	              charGraphics.setColor(textColor);
	              charGraphics.setFont(textFont);
	              int charX = (int) (0.5 * charDim - 0.5 * charWidth);
	              charGraphics.drawString("" + characterToShow, charX, (int) ((charDim - fontMetrics.getAscent()) / 2 + fontMetrics.getAscent()));
	              float x = horizMargin + spacePerChar * (i) - charDim / 2.0f;
	              int y = (int) ((height - charDim) / 2);
	              g.drawImage(charImage, (int) x, y, charDim, charDim, null, null);
	              charGraphics.dispose();
	          }
	          g.setColor(borderColor);
	          g.drawRect(0, 0, width - 1, height - 1);
	          g.dispose();
	          
	          captchaValue = finalString.toString();	//captchaString
	         
	          return bufferedImage;
	      } catch (Exception ioe) {
	          throw new RuntimeException("Unable to build image", ioe);
	      }
	    //@@end
	  }
public static String sendSMS2(String mob, String otp) {
		
		String output = "";
		
		try{
		      String msg="OTP for Login in portal is "+otp+" - SJVN Limited";//"Dear User, Your OTP for Login in E-portal is:"+otp;
		      String username = "sjvn.nic.in";
		      String password = "72704289";
		      String source = "SJVNIT";
		      String dltentityid="1701159437881162404";
		      String dltheaderid="1505159582519069403";
		      String dlttempid="1507161890443888361";//"1507159651603771743";

		      String smsURL="http://txtguru.in/imobile/api.php?";
			String requestUrl  = smsURL+"username="+username+"&password="+password+"&source="+source+"&dmobile="+mob
		    		  +"&dltentityid="+dltentityid+"&dltheaderid="+dltheaderid+"&dlttempid="+dlttempid
		    		  +"&message="+URLEncoder.encode(msg);
		          
		      URL url = new URL(requestUrl);
		      HttpURLConnection uc = (HttpURLConnection)url.openConnection();
		      
		      output = uc.getResponseMessage();
		      BufferedReader in = new BufferedReader( new InputStreamReader(uc.getInputStream()));
				String inputLine;
				StringBuffer response = new StringBuffer();

				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}
				in.close();

				output +="\n"+ response;
		      uc.disconnect();

		   } catch(Exception ex) {
		      return output +=ex.getMessage();

		   }
		
		return output;
	}
}
