package com.project.shopapp.controllers;

import com.project.shopapp.models.Product;
import com.project.shopapp.repositories.FavoriteRepository;
import com.project.shopapp.services.Favorite.FavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@RestController
@RequestMapping("${api.prefix}/favorites")
@CrossOrigin("*")
public class FavoriteController {
    @Autowired
    private FavoriteRepository favouriteRepository;

    @GetMapping("/user/{userId}")
    public ResponseEntity<Object> getFavoritesByUserId(@PathVariable Long userId) {
        try {
            return new ResponseEntity<>(favouriteRepository.findByUser_id(userId), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Lỗi khi lấy danh sách yêu thích", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @Autowired
    private FavoriteService favoriteService;

    @PostMapping("/toggle")
    public ResponseEntity<Boolean> toggleFavorite(@RequestParam Long userID, @RequestParam Long productID) {
        try {
            boolean isFavorited = favoriteService.toggleFavorite(userID, productID);
            return ResponseEntity.ok(isFavorited);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }


    // API kiểm tra trạng thái yêu thích của người dùng với sản phẩm
    @GetMapping("/check")
    public ResponseEntity<?> checkFavorite(@RequestParam Long userID, @RequestParam Long productID) {
        System.out.println(userID+productID);
        boolean isFavorited = favoriteService.isFavorited(userID, productID);

        Map<String, Object> response = new HashMap<>();
        response.put("userID", userID);
        response.put("productID", productID);
        response.put("favorited", isFavorited); // true nếu đã thích, false nếu chưa

        return ResponseEntity.ok(response);
    }

    @GetMapping("/favorites")
    public ResponseEntity<List<Product>> getFavoriteProducts(@RequestParam Long userID) {
        List<Product> favoriteProducts = favoriteService.getFavoriteProductsByUserId(userID);

        return ResponseEntity.ok(favoriteProducts);
    }
}
