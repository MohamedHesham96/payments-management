package com.hcoder.paymentsManagement.service.implement;

import com.hcoder.paymentsManagement.DTO.ClientSearchDTO;
import com.hcoder.paymentsManagement.DTO.Pagination;
import com.hcoder.paymentsManagement.entities.Client;
import com.hcoder.paymentsManagement.entities.Contract;
import com.hcoder.paymentsManagement.repository.ClientRepository;
import com.hcoder.paymentsManagement.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ClientServiceImpl implements ClientService {

    @Autowired
    ClientRepository clientRepository;

    @Override
    public List<Contract> getClientContracts(Integer clientId, Integer paymentDay) {
        return clientRepository.getClientContracts(clientId, paymentDay);
    }

    @Override
    public Page<Client> getClients(Pagination pagination) {
        Pageable pageable = PageRequest.of(pagination.getPage(), pagination.getSize(), Sort.by("name"));
        return clientRepository.findAll(pageable);
    }

    @Override
    public Client saveClient(Client client) {
        return clientRepository.save(client);
    }

    @Override
    public void deleteClient(Integer clientId) {
        clientRepository.deleteById(clientId);
    }

    @Override
    public Client getClient(Integer clientId) {
        Optional<Client> clientOptional = clientRepository.findById(clientId);
        return clientOptional.isPresent() ? clientOptional.get() : null;
    }

    @Override
    public List<Client> getAllClients() {
        return clientRepository.findAll();
    }

    @Override
    public Page<Client> searchInClients(ClientSearchDTO clientSearchDTO, Pagination pagination) {
        Pageable pageable = PageRequest.of(pagination.getPage(), pagination.getSize());
        return clientRepository.findClients(clientSearchDTO.getClientName(), pageable);
    }

    @Override
    public Page<Client> searchInPaymentDayClients(Integer paymentDay, ClientSearchDTO clientSearchDTO, Pagination pagination) {
        Pageable pageable = PageRequest.of(pagination.getPage(), pagination.getSize());
        return clientRepository.getClientByPaymentDay(paymentDay, clientSearchDTO.getClientName(), pageable);
    }
}
