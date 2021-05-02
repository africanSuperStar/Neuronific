//
//  SetAggregation.swift
//  Parsec
//
//  Created by Cameron de Bruyn on 2021/04/28.
//

// Set extension
//==============================================================================

//==============================================================================
// Extension containing aggregation methods.
extension Set
{
    /// Return a `Set` containing the results of mapping transform over `self`.
    ///
    /// - parameter transform: The transform function.
    /// - returns: A `Set` containing the results of mapping transform over
    ///   `self`.
    func map <T> (
        _ transform: (Iterator.Element) throws -> T
    )
    rethrows -> Set<T>
    {
        var mappedSet = Set <T> ()
        
        for elem in self
        {
            mappedSet.insert(try transform(elem))   
        }
        
        return mappedSet
        
    }
    
}
