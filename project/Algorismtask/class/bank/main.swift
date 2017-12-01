let account1: Account = Account(bankName: "우리", money: 3000)
let account2: Account = Account(bankName: "카카오", money: 5000)
let customer1 : Custom = Custom(name: "라이언", address: "강남")

customer1.acc = [account1, account2]
print(customer1.sumMoney())

