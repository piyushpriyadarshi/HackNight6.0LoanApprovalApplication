package com.syndhacathon.awsomecoders.repository;

import com.syndhacathon.awsomecoders.entity.AppUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface AppUserRepository extends JpaRepository<AppUser,Integer> {
    @Query(value = "SELECT * FROM app_user WHERE email = ?1",nativeQuery = true)
    public AppUser getAppUserByEmail(String email);
}
