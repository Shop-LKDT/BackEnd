package com.project.shopapp.repositories;

import com.project.shopapp.models.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface FavoriteRepository extends JpaRepository<Favorite, Long> {
    boolean existsByUserIdAndProductId(Long userId, Long productId);
    Favorite findByUserIdAndProductId(Long userId, Long productId);

    List<Favorite> findByUser_id(Long user_id);
    Optional<Favorite> findByUser_idAndProduct_id(Long user_id, Long product_id);

    @Query("SELECT f.product_id, SUM(f.count) as totalLikes FROM Favorite f GROUP BY f.user_id")
    List<Object[]> findTotalLikesForAllProducts();

    // Lấy danh sách sản phẩm yêu thích theo userID
    @Query("SELECT f.product FROM Favorite f WHERE f.user.id = :user_id")
    List<Product> findFavoriteProductsByUser_id(@Param("user_id") Long user_id);
}


