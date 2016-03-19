//
//  CalculateBrain.swift
//  Calculator
//
//  Created by Ayler_Lee on 16/3/13.
//  Copyright © 2016年 Ayler. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    private enum Op:CustomStringConvertible {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
        
        var description: String {
            get {
                switch self {
                case .Operand(let operand):
                    return "\(operand)"
                case .UnaryOperation(let symbol, _):
                    return symbol
                case .BinaryOperation(let symbol, _):
                    return symbol
                }
            }
        }
    }
    
    private var opStack = [Op]()
    private var knownOps = [String: Op]()
    
    init () {
        func learnOp(op: Op) {
            knownOps[op.description] = op
        }
        learnOp(Op.UnaryOperation("√", sqrt))
        knownOps["+"] = Op.BinaryOperation("+") { $0 + $1}
        knownOps["−"] = Op.BinaryOperation("−") { $1 - $0}
        knownOps["×"] = Op.BinaryOperation("×") { $0 * $1}
        knownOps["÷"] = Op.BinaryOperation("÷") { $1 / $0}
        
    }
    
    var program: AnyObject {
        get {
            return opStack.map { $0.description }
        }
        set {
            if let opSymbols = newValue as? Array<String> {
                var newOpStack = Array<Op>()
                for opSymbol in opSymbols {
                    if let op = knownOps[opSymbol] {
                        newOpStack.append(op)
                    } else if let operand = NSNumberFormatter().numberFromString(opSymbol)?.doubleValue {
                        newOpStack.append(.Operand(operand))
                    }
                }
            }
        }
    }
    
    private func evaluate(ops: [Op]) -> (result:Double?, remainingOps:[Op]) {
        if !ops.isEmpty {
            var remainingOps = ops
            let op = remainingOps.removeLast()
            
            switch op {
            case .Operand(let operand):
                return (operand, remainingOps)
                
            case .UnaryOperation(_, let operation):
                let operandEvaluation = evaluate(remainingOps)
                if let operand = operandEvaluation.result {
                    return (operation(operand), operandEvaluation.remainingOps)
                }
            case .BinaryOperation(_, let operation):
                let op1Evaluation = evaluate(remainingOps)
                if let operand1 = op1Evaluation.result {
                    let op2Evaluation = evaluate(op1Evaluation.remainingOps)
                    if let operand2 = op2Evaluation.result {
                        return (operation(operand1, operand2), op2Evaluation.remainingOps)
                    }
                }
            }
        }
        return (nil, ops)
    }

    func evaluate() -> Double? {
        let (result, remainder) = evaluate(opStack)
        print("\(opStack),  \(result), \(remainder)")
        return result
    }
    
    func pushOperand(oprand: Double) -> Double? {
        opStack.append(Op.Operand(oprand))
        return evaluate()
    }
    
    func performOperation(symble: String) -> Double? {
        if let operation = knownOps[symble] {
            opStack.append(operation)
        }
        return evaluate()
    }
}