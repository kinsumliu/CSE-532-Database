(:CSE532 Project 3:)
(:File name: tss_query5.xquery:)
(:Author Kin Sum Liu (109247869):)
(:Brief description: Query for "a chained coaudition":)
(:I pledge my honor that all parts of this project were done by me alone and without collaboration with anybody else:)

xquery version "3.0";
declare default element namespace "http://localhost:8080/exist/apps/tss-collection";

(:extract the contestants from the document:)
declare function local:extractContestants($audition as element()*) as element()* {
    for $contestant in $audition/Contestant
    return $contestant
};

(:find direct coaudition:)
declare function local:directCoaudition($contestant as element()*) as element()* {
    let $tss := doc("/db/apps/tss-collection/tss.xml")/TSS
    for $show1 in $tss/Show,
        $audition1 in $show1/Audition,
        $result1 in $audition1/Results/Result
    where $audition1/Contestant = $contestant
    return
        for $show2 in $tss/Show,
            $audition2 in $show2/Audition,
            $result2 in $audition2/Results/Result
        where $show1/ShowDate = $show2/ShowDate and
                $result1/Judge = $result2/Judge and
                $result1/Score = $result2/Score and
                $audition1/Piece = $audition2/Piece and
                $audition1/Contestant != $audition2/Contestant
        return $audition2/Contestant
};

declare function local:indirectCoaudition($contestant as element()*, $visited as element()*) as element()*{
    (:base case direct coaudition:)
    let $direct := local:directCoaudition($contestant)
    for $other in $direct
    return
        (:cycle check. if the list stops growing, return an empty cycle element to notify the function that calls it:)
        if ($other intersect $visited)
            then <cycle/>
        (:recursive definition. the list of coaudition grows every iteration by taking union of two sets:)
        else ($direct | local:indirectCoaudition($other, $visited|$other))
};

let $tss := doc("/db/apps/tss-collection/tss.xml")/TSS
return
    <query5>
    {
        for $contestant1 in distinct-values(
            for $audition in $tss/Show/Audition
            return local:extractContestants($audition))
        (:check empty. contestant1 must have some coaudition otherwise it wont be returned as result:)
        where local:directCoaudition(<Contestant>{$contestant1}</Contestant>)
        return
            (:find all coaudition by calling indirectCoaudition:)
            for $other in distinct-values(local:indirectCoaudition(<Contestant>{$contestant1}</Contestant>, <Contestant>{$contestant1}</Contestant>))
            (:remove duplicate:)
            where $contestant1 < $other
            return <result>{concat( $contestant1, " coaudits with ", $other)}</result>
    }</query5>
