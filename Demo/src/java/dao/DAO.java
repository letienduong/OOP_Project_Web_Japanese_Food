/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Account;
import entity.Category;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author trinh
 */
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {

        }
        return list;
    }
    
    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where cateID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where [name] like ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1,"%"+ txtSearch+"%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductByID(String id) {
        String query = "select * from product\n"
                + "where id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from category";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Integer getTotalpages() {
        String query = "SELECT COUNT(*) FROM product";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
             while (rs.next()){
                if (rs.getInt(1)%8==0)
                    return rs.getInt(1)/8;
                else return rs.getInt(1)/8+1;
            }
        }
        catch (Exception e) {
        }
        return 0;
    }
  
    public List<Product> getProductByPage(int startIndex, int itemsPerPage) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM product LIMIT ?, ?";

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, startIndex);
            ps.setInt(2, itemsPerPage);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductByPageCID(String cid, int startIndex, int itemsPerPage) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM product WHERE cateID = ? LIMIT ?, ?";

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            ps.setInt(2, startIndex);
            ps.setInt(3, itemsPerPage);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Integer getTotalpagesCID(String cid) {
        String query = "SELECT COUNT(*) FROM product WHERE cateID = ? ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
             while (rs.next()){
                if (rs.getInt(1)%8==0)
                    return rs.getInt(1)/8;
                else return rs.getInt(1)/8+1;
            }
        }
        catch (Exception e) {
        }
        return 0;
    }
    
    public Account login(String user, String pass) {
        String query = "select * from account\n"
                + "where user = ?\n"
                + "and pass = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public Account checkAccountExist(String user) {
        String query = "select * from account\n"
                + "where user = ?\n";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void singup(String user, String pass) {
        String getMaxUIDQuery = "SELECT COALESCE(MAX(UID), 0) AS max_uid FROM account;";
        String insertQuery = "INSERT INTO account (UID, user, pass,isSell,isAdmin) VALUES (?, ?, ?, 0, 0);";
        try {
            conn = new DBContext().getConnection();

            // Lấy giá trị MAX(UID)
            ps = conn.prepareStatement(getMaxUIDQuery);
            rs = ps.executeQuery();
            int newUID = 1;
            if (rs.next()) {
                newUID = rs.getInt("max_uid") + 1;
            }

            // Thực hiện INSERT
            ps = conn.prepareStatement(insertQuery);
            ps.setInt(1, newUID);
            ps.setString(2, user);
            ps.setString(3, pass);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void deleteProduct(String pid){
        String query= "delete from product\n"+
                "where id= ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void insertProduct(String name, String image, String price,
                            String title, String category, String description){
        String query="INSERT INTO product (name, image, price, title, cateID, description) \n" +
                    "VALUES (?,?,?,?,?,?)";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, category);
            ps.setString(6, description);  
            ps.executeUpdate();
        }catch(Exception e){
        }
    }
    
    public void updateProduct(String name, String image, String price,
                            String title, String category, String description, String id){
        String query= "UPDATE product\n" +
                        "SET name = ?, \n" +
                        "    image = ?, \n" +
                        "    price = ?, \n" +
                        "    title = ?, \n" +
                        "    cateID = ?, \n" +
                        "    description = ? \n" + 
                        "WHERE id = ?";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, category);
            ps.setString(6, description);
            ps.setString(7, id);
            ps.executeUpdate();
        }catch(Exception e){
        }
    }
//    public static void main(String[] args) {
//        DAO dao = new DAO();
//        List<Product> list=new ArrayList<>();
//        dao.deleteProduct(8);
//        list=dao.getAllProduct();
//        System.out.println(list.size());
//    }
}
