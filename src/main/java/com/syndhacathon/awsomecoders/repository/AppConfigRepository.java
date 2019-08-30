package com.syndhacathon.awsomecoders.repository;

import com.syndhacathon.awsomecoders.entity.AppConfig;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AppConfigRepository extends JpaRepository<AppConfig,Integer> {
    @Query(value = "SELECT * FROM app_config WHERE datakey = ?1",nativeQuery = true)
    public AppConfig getValue(String key);
}
