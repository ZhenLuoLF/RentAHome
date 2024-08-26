package com.rentahome.controller;

import com.rentahome.dto.PropertyDTO;
import com.rentahome.dto.PropertyTypeDTO;
import com.rentahome.service.Converter;
import com.rentahome.service.PropertyService;
import com.rentahome.service.PropertyTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/property")
public class PropertyController {

    @Autowired
    PropertyService propertyService;

    @Autowired
    PropertyTypeService propertyTypeService;

    @GetMapping("/getPropertyType")
    public ResponseEntity<List<PropertyTypeDTO>> getPropertyType(){
        List<PropertyTypeDTO> propertyTypeDTOS = propertyTypeService.getPropertyTypes();
        System.out.println("inside getPropertyType");
        return ResponseEntity.ok(propertyTypeDTOS);
    }

    @GetMapping( "/searchWithAddress/")
    public ResponseEntity<List<PropertyDTO>> searchWithAddress(@RequestParam String address) {
        List<PropertyDTO> propertyDTOS = propertyService.searchWithAddress(address);
        return ResponseEntity.ok(propertyDTOS);
    }
    @GetMapping("/searchAvailableProperty")
    public ResponseEntity<List<PropertyDTO>> searchAvailableProperty(@RequestParam String address,
                                                                     @RequestParam String checkInDate,
                                                                     @RequestParam String checkOutDate) {
        LocalDate checkIn = LocalDate.parse(checkInDate);
        LocalDate checkOut = LocalDate.parse(checkOutDate);
        List<PropertyDTO> propertyDTOS = propertyService.searchAvailableProperty(address, checkIn, checkOut);

        return ResponseEntity.ok(propertyDTOS);

    }

    @GetMapping("/getAllProperty")
    public ResponseEntity<List<PropertyDTO>> getAllProperty() {

        List<PropertyDTO> propertyDTOS = propertyService.getAllProperties();
        return ResponseEntity.ok(propertyDTOS);
    }
    @GetMapping("/getProperty/{propertyId}")
    public PropertyDTO getProperty(@PathVariable Integer propertyId) {
        System.out.println(propertyId);
        return propertyService.getProperty(propertyId);
    }

    @GetMapping("/getOwnerProperty/{ownerId}")
    public ResponseEntity<List<PropertyDTO>> getOwnerProperty(@PathVariable Integer ownerId) {
        List<PropertyDTO> propertyDTOS = propertyService.getOwnerProperties(ownerId);
        return ResponseEntity.ok(propertyDTOS);
    }

    @DeleteMapping("/{propertyId}")
    public void deleteProperty(@PathVariable Integer propertyId) {
        propertyService.deleteProperty(propertyId);
    }

//    @PostMapping("/updateProperty")
//    public void updateProperty(@RequestBody PropertyDTO propertyDTO) {
//        propertyService.updateProperty(propertyDTO);
//    }
    @PutMapping("/updateProperty")
    public void updateProperty(@RequestBody PropertyDTO propertyDTO) {
        propertyService.updateProperty(propertyDTO);
    }
    @PostMapping("/addProperty")
    public void addProperty(@RequestBody PropertyDTO propertyDTO) {
        propertyService.addProperty(propertyDTO);
    }

}
