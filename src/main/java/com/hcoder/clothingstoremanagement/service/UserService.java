package com.hcoder.clothingstoremanagement.service;

import java.util.List;

import com.hcoder.clothingstoremanagement.entity.Bill;
import com.hcoder.clothingstoremanagement.entity.Client;
import com.hcoder.clothingstoremanagement.entity.ClientRecord;
import com.hcoder.clothingstoremanagement.entity.Incoming;
import com.hcoder.clothingstoremanagement.entity.Spending;
import com.hcoder.clothingstoremanagement.entity.Warehouse;

public interface UserService {

	public List<Bill> getAllBills();

	public List<Bill> getBillsByDate(String date);
	
	public Client getClientById(int id);
	
	public void saveClientRecord(ClientRecord clientRecord);

	public List<Client> getAllClients();

	public List<Client> getClientRecords();

	public List<Incoming> GetIncomingsByDate(String date);

	public List<Incoming> GetAllIncoming();

	public Warehouse getWarehouseById(int id);

	public void updateWarehouseQuantity(Warehouse warehouse);

	public void addToWarehouse(Warehouse warehouse);

	public List<Warehouse> getAllWarehouse();

	public void AddIncoming(Incoming incoming);

	void addBill(Bill theBill);

	public List<Spending> getSpendingsByDate(String date);
	
	public List<Spending> getAllSpending();

	public int getClientsDraweeTotal();

	public int getSpendingTotal();

	public int getIcomingTotal();

	public int getWarehouseTotal();
	
	public void makeSpendingOpertaion(Spending spending);
	
	public void saveClient(Client client);
	
	public void payOffAmount(Client client);
	
	public ClientRecord getClientRecordById(int id);



}
