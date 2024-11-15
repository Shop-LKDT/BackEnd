package com.project.shopapp.services.Favorite;

import com.project.shopapp.models.Favorite;
import com.project.shopapp.models.Product;
import com.project.shopapp.repositories.FavoriteRepository;
import com.project.shopapp.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FavoriteService {
    @Autowired
    private FavoriteRepository favouriteRepository;

    @Autowired
    private ProductRepository productRepository;

    // Lấy danh sách sản phẩm yêu thích theo userID
    public List<Product> getFavoriteProductsByUserId(Long userID) {
        return favouriteRepository.findFavoriteProductsByUser_id(userID);
    }

    public void toggleFavorite(Long user_id, Long product_id) {
        // Kiểm tra xem yêu thích đã tồn tại hay chưa
        Optional<Favorite> favoriteOptional = favouriteRepository.findByUser_idAndProduct_id(user_id, product_id);

        if (favoriteOptional.isPresent()) {
            // Nếu đã tồn tại, giảm biến đếm và xóa khỏi yêu thích
            Favorite favorite = favoriteOptional.get();
            Product product = productRepository.findById(product_id).orElseThrow(() -> new RuntimeException("Product not found"));
            favouriteRepository.delete(favorite);
            product.setCount(product.getCount() - 1); // Giảm số lượt thích
            productRepository.save(product);
        } else {
            // Nếu chưa tồn tại, thêm mới và tăng biến đếm
            Favorite favorite = new Favorite();
            favorite.setUser_id(user_id);
            favorite.setProduct_id(product_id);
            favorite.setCount(1);

            Product product = productRepository.findById(product_id).orElseThrow(() -> new RuntimeException("Product not found"));
            product.setCount(product.getCount() + 1); // Tăng số lượt thích
            productRepository.save(product);

            favouriteRepository.save(favorite);
        }
    }
    public List<Object[]> getTotalLikesForAllProducts() {
        return favouriteRepository.findTotalLikesForAllProducts();
    }
    // Kiểm tra xem người dùng đã thích sản phẩm chưa
    public boolean isFavorited(Long user_id, Long product_id) {
        Optional<Favorite> favorite = favouriteRepository.findByUser_idAndProduct_id(user_id, product_id);
        return favorite.isPresent(); // true nếu tìm thấy bản ghi, false nếu không tìm thấy
    }

    public void addToFavorites(Long productId, Long userId) {
        // Logic to add a product to the user's favorite list
    }

}
