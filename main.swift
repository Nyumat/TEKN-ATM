//
//  main.swift
//  TEKN-ATM
//
//  Created by Thomas Nyuma on 6/22/20.
//  Copyright © 2020 Thomas Nyuma. All rights reserved.
//

import Foundation

//Deposit Struct to clean some of the code up.

struct deposit {
    
    var dep200: Int
    var dep100:Int
    var dep300:Int
    var dep400:Int
    
    // Actual deposit methods to call upon when user is trying to deposit x amount of money.
    
    func deposit100() {
        
        accountBalance += 100
        print("\(dep100) dollars has been deposited into account #\(accountNum). Your new account balance is \(accountBalance)")
        
    }
    
    func deposit200 () {
        
        accountBalance += 200
        print("\(dep200) dollars has been deposited into account #\(accountNum). Your new account balance is \(accountBalance)")
        
    }
    
    func deposit300 () {
        accountBalance += 300
        print("\(dep300) dollars has been deposited into account #\(accountNum). Your new account balance is \(accountBalance)")
    }
    
    func deposit400 () {
        accountBalance += 400
        print("\(dep400) dollars has been deposited into account #\(accountNum). Your new account balance is \(accountBalance)")
    }
    
}

//Withdraw structure which will be used to call the methods to withdraw x money.
struct withdraw {
    
    var with200:Int
    var with300:Int
    var with400:Int
    var with500:Int
    
    // Withdraw methods to call upon when user is trying to withdraw x amount of money.
    
    func withdraw200() {
        accountBalance -= 200
        print("\(with200) dollars has been withdrawn from account #\(accountNum). Your new account balance is \(accountBalance)")
    }
    
    func withdraw300 () {
        accountBalance -= 300
        print("\(with300) dollars has been withdrawn from account #\(accountNum). Your new account balance is \(accountBalance)")
    }

    func withdraw400() {
        accountBalance -= 400
        print("\(with400) dollars has been withdrawn from account #\(accountNum). Your new account balance is \(accountBalance)")
    }
    
    func withdraw500() {
        accountBalance -= 500
        print("\(with500) dollars has been withdrawn from account #\(accountNum). Your new account balance is \(accountBalance)")
    }
    
}


// Login Global Variables
var loginTry = 3
var loggedIn = false

// Account Number Global Variables

let accountNum = "3355864804297750"
var haveAccountNum = false

// Pin Global Variables

var pinCorrect = false
var pinTry = 3

// ATM Global Variables

let accessCode = "3355"
var accountBalance = 10000

// Deposit Global Variables

var dep = deposit(dep200: 200,dep100: 100,dep300: 300,dep400: 400)
var with = withdraw(with200: 200,with300:300,with400:400,with500: 500)



//Function to prompt the users account number.
func promptAccountNum () {
print("What is your account number")
let accountNumInput = readLine()

    if accountNumInput == accountNum {
        
        print("Access granted.")
        loggedIn = true
        
} else {
        //Counter for the AN attempts.
loginTry = loginTry - 1
        
        switch loginTry {
        case 2 :
             print("Wrong entry. Please try again. 2 tries remain before you will be locked out, requiring an access code.")
        case 1:
            print("Wrong entry. Please try again. 1 try reamins before you will be locked out, requiring an access code.")
        case 0 :
            print("You have been locked out. Please enter an access code to proceed.")
            let accessCodeInput = readLine()
            if accessCodeInput == accessCode {
                print("Welcome back, Thomas")
                loggedIn = true
                promptPin()
            } else {
                
                print("Incorrect access code. Please try again.")
                let accessCodeInput = readLine()
                if accessCodeInput == accessCode {
                    print("Acess granted.")
                    promptPin()
                }
                
            }
            
        default:
            print("Derp.")
            
        }
        
    }
    
}

// Function to prompt the users pin number.
func promptPin () {
    
    while pinCorrect == false {
        
        let pin = "614353"
        
        print("Please enter a pin number.")
        let pinNumInput = readLine()
        if pinNumInput == pin {
            
            print("Entering system...")
            pinCorrect = true
            loggedIn = true
            
        } else {
            
            pinTry = pinTry - 1 //Counter for the Pin
            
            switch pinTry {
                
            case 2 :
                print("Incorrect Pin. 2 tries before lockout")
            case 1:
                print("Incorrect Pin. 1 try before lockout.")
            case 0:
                print("You have been locked out. Please enter an access code to access the account.")
                let accessCodeInput = readLine()
                if accessCodeInput == accessCode {
                    print("Welcome back, Thomas")
                    loggedIn = true
                } else {
                    
                    print("Incorrect access code. Please try again.")
                    let accessCodeInput = readLine()
                    if accessCodeInput == accessCode {
                        print("Welcome back, Thomas")
                        loggedIn = true
                    }
                    
                    
                }
            default:
                print("Derp.")
            }
        
        }
        
    }
    
}

// Function to keep the program running during ATM use. Encased in a while loop because why not?

func login () {

    while loggedIn == false {
        
        if haveAccountNum == true{
            
            promptAccountNum()
            
        } else {
            //Secruity measures.
            promptPin()
            
        }
        
    }

    while loggedIn == true {
        
        start()
        
    }
    
    
}

// Function to welcome user to the ATM at the beginning of the program.

func welcomeThem () {

    print("Welcome to this ATM. Do you have an account number ? Type \"yes\" to agree.")
    let haveANInput = readLine()
    if haveANInput == "yes" {
        haveAccountNum = true
        promptAccountNum()
    } else {
        promptPin()
    }
    
}

// Actual ATM use function, *used in one place only.
func start () {
    
    print("Would you like to do a deposit, a withdraw, or exit the ATM?")
    let atmChoice = readLine()
    
    switch atmChoice {
    case "deposit":
        print("How much would you like to deposit? (100,200,300,400) ")
            let depositChoice = readLine()
        switch depositChoice {
        case "100" :
            dep.deposit100()
        case "200":
            dep.deposit200()
        case "300" :
            dep.deposit300()                                                                            // Withdraw Switch statement cases.
        case "400":
            dep.deposit400()
        default:
            print("Please, choose a value.")
        }
    case "withdraw":
        print("How much would you like to withdraw? (200,300,400,500)")
            let withdrawChoice = readLine()
        switch withdrawChoice {
        case "200":
                with.withdraw200()
        case "300":
                with.withdraw300()
        case "400":
                with.withdraw400()                                                      // Withdraw Switch statement cases.
        case "500":
                with.withdraw500()
        default:
            print("Please, choose a value.")
        }
        
    default:
       sayGoodbye()
       loggedIn = false
    }
    
}


// Say goodbye to user when they're done with our ATM.

func sayGoodbye() {
    print("Thank you for using the ATM.")
}



// "Beginning of the actual functional programming, where the functions are actually called.
welcomeThem()
login()
