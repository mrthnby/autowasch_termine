package com.LottoCrew.AutowaschTermine.repository;

import com.LottoCrew.AutowaschTermine.model.termin;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;
import java.util.Optional;

public interface TerminRepository extends MongoRepository<termin, String> {

    List<termin> findAllByName(String name);
    Optional<termin> findByName(String name);
}
