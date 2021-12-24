package com.db;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author Shubham
 */
public class Database {

    private Connection conn;

    public Database(Connection conn) {
        this.conn = conn;
    }

    /**
     * @param iduser
     * @return the username
     */
    public User getUser(String iduser) {
        User user = null;
        try {
            String sql = "select * from crimson.user where iduser = ?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, iduser);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getDate(4), rs.getString(5).charAt(0), rs.getString(6),
                        rs.getString(7), rs.getBoolean(8));
            }
        } catch (SQLException ex) {
            return null;
        }
        return user;
    }

    public UserProfile getUserProfile(String iduser) {
        UserProfile userProfile = null;
        try {
            String sql = "SELECT * FROM crimson.profile where username = ?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, iduser);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userProfile = new UserProfile(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
        return userProfile;
    }

    public User getUserByEmail(String email) {
        User user = null;
        try {
            String sql = "select * from crimson.user where email = ?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getDate(4), rs.getString(5).charAt(0), rs.getString(6),
                        rs.getString(7), rs.getBoolean(8));
            }
        } catch (SQLException ex) {
            return null;
        }
        return user;
    }

    public boolean addToken(String username, String token) {
        try {
            String sql = "insert into crimson.tokens values(?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, token);
            ps.executeUpdate();
        } catch (SQLException ex) {
            return false;
        }
        return true;
    }

    public boolean updateToken(String username, String token) {
        try {
            String sql = "UPDATE crimson.tokens SET token=? WHERE userid=? ;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, token);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            return false;
        }
        return true;
    }

    public String getToken(String username) {
        try {
            String sql = "select token from crimson.tokens where userid = ?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException ex) {
            return null;
        }
        return null;
    }

    public byte[] getImage(int id) {
        PreparedStatement ps2;
        byte[] blobAsBytes = null;
        try {
            ps2 = conn.prepareStatement("SELECT image FROM crimson.images where idimages = ?;");
            ps2.setString(1, id + "");
            ResultSet rs2 = ps2.executeQuery();
            if (rs2.next()) {
                Blob blob = rs2.getBlob(1);
                int blobLength = (int) blob.length();
                blobAsBytes = blob.getBytes(1, blobLength);
                blob.free();
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blobAsBytes;
    }

    public int addImage(byte image[], String user) {
        int op = -1;
        try {
            Blob img = new javax.sql.rowset.serial.SerialBlob(image);
            String sql = "INSERT INTO `crimson`.`images` (`image`, `by`) VALUES (?, ?);";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setBlob(1, img);
            ps.setString(2, user);
            ps.executeUpdate();
            PreparedStatement ps2 = conn.prepareStatement("SELECT LAST_INSERT_ID();");
            ResultSet rs = ps2.executeQuery();
            if (rs.next()) {
                op = rs.getInt(1);
            }
        } catch (SQLException ex) {
        }
        return op;
    }

    public boolean newPost(String user, String post, int image) {
        try {
            String sql = "INSERT INTO `crimson`.`posts` (`from`, `likes`, `post`, `img`) VALUES (?,'0',?,?);";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, post);
            ps.setInt(3, image);
            ps.executeUpdate();
        } catch (SQLException ex) {
            return false;
        }
        return true;
    }

    public boolean activateAccount(String uid) {
        try {

            String sql = "UPDATE crimson.user SET activated='1' WHERE iduser=?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, uid);
            ps.executeUpdate();

            String sql2 = "DELETE FROM crimson.tokens WHERE userid=?;";
            PreparedStatement ps2 = conn.prepareStatement(sql2);
            ps2.setString(1, uid);
            ps2.executeUpdate();

            String sql3 = "INSERT INTO crimson.profile (username) VALUES (?)";
            PreparedStatement ps3 = conn.prepareStatement(sql3);
            ps3.setString(1, uid);
            ps3.executeUpdate();

            return true;
        } catch (SQLException ex) {
            return false;
        }
    }

    public boolean addUser(String username,
            String fname,
            String lname,
            Date dob,
            String gender,
            String email,
            String password,
            int activated) {
        try {
            String sql = "insert into crimson.user values(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, fname);
            ps.setString(3, lname);
            ps.setString(4, dob.toString());
            ps.setString(5, gender);
            ps.setString(6, email);
            ps.setString(7, password);
            ps.setString(8, activated + "");
            ps.executeUpdate();
        } catch (SQLException ex) {
            return false;
        }
        return true;
    }

    public boolean addUserProfile(String username,
            String pp,
            String about,
            String phone,
            String interest,
            String insta,
            String snapchat,
            String twitter,
            String linked
    ) {
        try {
            String sql = "UPDATE `crimson`.`profile` SET `profilepic`=?, "
                    + "`about`=?, `phone`=?, `interest`=?, `instagram`=?, "
                    + "`snapchat`=?, `twitter`=?, `linkedin`=? WHERE `username`=?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pp);
            ps.setString(2, about);
            ps.setString(3, phone);
            ps.setString(4, interest);
            ps.setString(5, insta);
            ps.setString(6, snapchat);
            ps.setString(7, twitter);
            ps.setString(8, linked);
            ps.setString(9, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            return false;
        }
        return true;
    }

    public boolean updatePassword(
            String username,
            String password
    ) {
        try {
            String sql = "UPDATE `crimson`.`user` SET `password`= ? WHERE `iduser`= ?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            return false;
        }
        return true;
    }

    public boolean addFollower(String follower, String following) {
        try {
            String sql = "INSERT INTO `crimson`.`followers` (`follower`, `following`, `status`) VALUES ( ?, ?, '0');";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, follower);
            ps.setString(2, following);
            ps.executeUpdate();
        } catch (SQLException ex) {
            return false;
        }
        return true;
    }

    public boolean updateUser(
            String fname,
            String lname,
            String dob,
            String gender,
            String user) {
        try {
            String sql = "UPDATE `crimson`.`user` SET `fname`= ? , `lname`= ? , `dob`= ? , `gender`= ? WHERE `iduser`= ?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, fname);
            ps.setString(2, lname);
            ps.setString(3, dob);
            ps.setString(4, gender);
            ps.setString(5, user);
            ps.executeUpdate();
        } catch (SQLException ex) {
            return false;
        }
        return true;
    }

    public boolean acceptRequest(String follower, String following) {
        try {
            String sql = "UPDATE `crimson`.`followers` SET `status`='1' WHERE `follower`=? and`following`=?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, follower);
            ps.setString(2, following);
            ps.executeUpdate();
        } catch (SQLException ex) {
            return false;
        }
        return true;
    }

    public boolean unfollow(String follower, String following) {
        try {
            String sql = "DELETE FROM `crimson`.`followers` WHERE `follower`=? and`following`=?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, follower);
            ps.setString(2, following);
            ps.executeUpdate();
        } catch (SQLException ex) {
            return false;
        }
        return true;
    }

}
