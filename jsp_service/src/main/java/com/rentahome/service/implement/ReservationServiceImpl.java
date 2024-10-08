package com.rentahome.service.implement;

import com.rentahome.dto.PropertyDTO;
import com.rentahome.dto.ReservationDTO;
import com.rentahome.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
public class ReservationServiceImpl implements ReservationService {

    @Autowired
    private RestTemplate restTemplate;

    private static final String RESERVATION_SERVICE_URL = "http://localhost:8081/reservation";

    @Override
    public List<ReservationDTO> getOtherReservation(Integer userId){
        ResponseEntity<List<ReservationDTO>> rateResponse =
                restTemplate.exchange(RESERVATION_SERVICE_URL+"/getOtherReservation/"+userId,
                        HttpMethod.GET, null, new ParameterizedTypeReference<List<ReservationDTO>>() {
                        });
        List<ReservationDTO> reservationDTOS = rateResponse.getBody();
        if(reservationDTOS == null){
            reservationDTOS = new ArrayList<>();
        }
        return reservationDTOS;
    }
    @Override
    public List<ReservationDTO> getOwnerReservation(Integer ownerId){
        ResponseEntity<List<ReservationDTO>> rateResponse =
                restTemplate.exchange(RESERVATION_SERVICE_URL+"/getOwnerReservation/"+ownerId,
                        HttpMethod.GET, null, new ParameterizedTypeReference<List<ReservationDTO>>() {
                        });
        List<ReservationDTO> reservationDTOS = rateResponse.getBody();
        if(reservationDTOS == null){
            reservationDTOS = new ArrayList<>();
        }
        return reservationDTOS;
    }

    @Override
    public void reserveProperty(Integer userId, LocalDate checkin, LocalDate checkout, PropertyDTO property){
        ReservationDTO reservationDTO = new ReservationDTO();
        reservationDTO.setUserId(userId);
        reservationDTO.setPropertyId(property.getPropertyId());
        reservationDTO.setStatus("Pending");
        reservationDTO.setEndDate(checkout);
        reservationDTO.setStartDate(checkin);
        restTemplate.postForObject(RESERVATION_SERVICE_URL+"/reserveProperty", reservationDTO, ReservationDTO.class);
    }

    @Override
    public void confirmReservation(Integer reservationId){
        restTemplate.getForEntity(RESERVATION_SERVICE_URL+"/confirmReservation/"+reservationId, void.class);
    }
}
