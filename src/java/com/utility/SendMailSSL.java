package com.utility;

import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMailSSL {

    public SendMailSSL() {}

    public boolean sendMail(String url, String address) {
        String msg = "<!DOCTYPE html>\n"
                + "<html>\n"
                + "<head>\n"
                + "<title>Servlet Activation</title>\n"
                + "</head>\n"
                + "<body>  <div class=\"\" style=\"background-color: #f6f6f6; font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\">\n"
                + "    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"body\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background-color: #f6f6f6;\">\n"
                + "      <tr>\n"
                + "        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">&nbsp;</td>\n"
                + "        <td class=\"container\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; display: block; Margin: 0 auto; max-width: 580px; padding: 10px; width: 580px;\">\n"
                + "          <div class=\"content\" style=\"box-sizing: border-box; display: block; Margin: 0 auto; max-width: 580px; padding: 10px;\">\n"
                + "\n"
                + "            <!-- START CENTERED WHITE CONTAINER -->\n"
                + "            <span class=\"preheader\" style=\"color: transparent; display: none; height: 0; max-height: 0; max-width: 0; opacity: 0; overflow: hidden; mso-hide: all; visibility: hidden; width: 0;\">This is preheader text. Some clients will show this text as a preview.</span>\n"
                + "            <table class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\">\n"
                + "\n"
                + "              <!-- START MAIN CONTENT AREA -->\n"
                + "              <tr>\n"
                + "                <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\">\n"
                + "                  <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">\n"
                + "                    <tr>\n"
                + "                      <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">\n"
                + "                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Hi there,</p>\n"
                + "                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">We are happy that you decided to join the Crimson community. Your first Crimson experience is just a click away!</p>\n"
                + "                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"btn btn-primary\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; box-sizing: border-box;\">\n"
                + "                          <tbody>\n"
                + "                            <tr>\n"
                + "                              <td align=\"left\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; padding-bottom: 15px;\">\n"
                + "                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: auto;\">\n"
                + "                                  <tbody>\n"
                + "                                    <tr>\n"
                + "                                      <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; background-color: #3498db; border-radius: 5px; text-align: center;\"> <a href=\"" + url + "\" target=\"_blank\" style=\"display: inline-block; color: #ffffff; background-color: #e41414; border: solid 1px #3498db; border-radius: 5px; box-sizing: border-box; cursor: pointer; text-decoration: none; font-size: 14px; font-weight: bold; margin: 0; padding: 12px 25px; text-transform: capitalize; border-color: black;\">Activate</a> </td>\n"
                + "                                    </tr>\n"
                + "                                  </tbody>\n"
                + "                                </table>\n"
                + "                              </td>\n"
                + "                            </tr>\n"
                + "                          </tbody>\n"
                + "                        </table>\n"
                + "                        <p><a href=\""+url+"\" target=\"_blank\">"+url+"</a></p>  <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Thank you!</p>\n"
                + "                      </td>\n"
                + "                    </tr>\n"
                + "                  </table>\n"
                + "                </td>\n"
                + "              </tr>\n"
                + "\n"
                + "            <!-- END MAIN CONTENT AREA -->\n"
                + "            </table>\n"
                + "\n"
                + "            <!-- START FOOTER -->\n"
                + "            <div class=\"footer\" style=\"clear: both; Margin-top: 10px; text-align: center; width: 100%;\">\n"
                + "              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">\n"
                + "                                <tr>\n"
                + "                  <td class=\"content-block powered-by\" style=\"font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; font-size: 12px; color: #999999; text-align: center;\">\n"
                + "                    Powered by <a href=\"www.crimsonme.com\" target=\"_blank\" style=\"color: #999999; font-size: 12px; text-align: center;\">Crimson</a>.\n"
                + "                  </td>\n"
                + "                </tr>\n"
                + "              </table>\n"
                + "            </div>\n"
                + "            <!-- END FOOTER -->\n"
                + "\n"
                + "          <!-- END CENTERED WHITE CONTAINER -->\n"
                + "          </div>\n"
                + "        </td>\n"
                + "        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">&nbsp;</td>\n"
                + "      </tr>\n"
                + "    </table>\n"
                + "  </div>\n"
                + "\n"
                + "</body>\n"
                + "</html>";

        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");//
        props.put("mail.smtp.host", "smtp.live.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "25");

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("no-replay.crimson@outlook.com", "100papers");
            }
        });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("no-replay.crimson@outlook.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(address + ""));
            message.setSubject("Acount Registration");
            message.setSentDate(new Date());

            message.setContent(msg, "text/html; charset=utf-8");

            Transport.send(message);

            return true;

        } catch (MessagingException e) {
            return false;
        }
    }
}
