package com.LottoCrew.AutowaschTermine.service;

import com.LottoCrew.AutowaschTermine.exception.UserAlreadyExistsException;
import com.LottoCrew.AutowaschTermine.exception.UserNotFoundException;
import com.LottoCrew.AutowaschTermine.model.termin;
import com.LottoCrew.AutowaschTermine.model.user;
import com.LottoCrew.AutowaschTermine.repository.TerminRepository;
import com.LottoCrew.AutowaschTermine.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.data.mongodb.core.query.Term;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class TerminService {

    private final TerminRepository terminRepository;
    public List<termin> getTermins(String name) {
        if (name == null) {
            return terminRepository.findAll();
        } else {
            return  terminRepository.findAllByName(name);
        }

    }

    public termin createTermin(termin newTermin) {

        Optional<termin> terminByName = terminRepository.findByName(newTermin.getName());
        if (terminByName.isPresent()) {
            throw new UserAlreadyExistsException("User already exists with name: " + newTermin.getName());
        }
        return terminRepository.save(newTermin);
    }

    public void deleteTermin(String id) {
        terminRepository.deleteById(id);
    }

    public termin getTerminById(String id) {
        return  terminRepository.findById(id)
                .orElseThrow(() ->new UserNotFoundException("User not found with id: " + id ));
    }

    public void updateTermin(String id, termin newTermin) {
        termin oldTermin = getTerminById(id);
        oldTermin.setName(newTermin.getName());
        oldTermin.setPhoneNumber(newTermin.getPhoneNumber());
        oldTermin.setPlateNumber(newTermin.getPlateNumber());
        terminRepository.save(oldTermin);
    }
}
