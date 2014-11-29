(:CSE532 Project 3:)
(:File name: tss_query4a.xquery:)
(:Author Kin Sum Liu (109247869):)
(:Brief description: Query for "first contestant performed all the pieces of the second contestant without quantifiers":)

xquery version "3.0";
declare default element namespace "http://localhost:8080/exist/apps/tss-collection";

(:extract the contestants from the document:)
declare function local:extractContestants($audition as element()*) as element()* {
    for $contestant in $audition/Contestant
    return $contestant
};

(:SongsC2PlayButNotC1 returns the pieces that contestant1 doesn't play but contestant2 plays :)
declare function local:SongsC2PlayButNotC1($contestant1 as element(), $contestant2 as element()) as element()*{
    let $tss := doc("/db/apps/tss-collection/tss.xml")/TSS,
        $contestant2Pieces :=
            for $audition2 in $tss/Show/Audition
            where $audition2/Contestant = $contestant2
            return $audition2/Piece
    for $piece in $contestant2Pieces
    (:contestant1 does not play the $piece:)
    where (empty($tss/Show/Audition[Piece = $piece and Contestant = $contestant1]))
    return $piece
};

let $tss := doc("/db/apps/tss-collection/tss.xml")/TSS
return
    <query4>
    {
        for $contestant1 in distinct-values(
             for $audition in $tss/Show/Audition
             (:extract contestant and return a list of distinct contestants:)
             return local:extractContestants($audition))
        return 
            for $contestant2 in distinct-values(
                for $audition in $tss/Show/Audition
                return local:extractContestants($audition))
            (:cannot find a piece that contestant1 doesn't play but contestants plays:)
            (:otherwise contestant1 does not dominate contestant2:)
            where empty(local:SongsC2PlayButNotC1(<Contestant>{$contestant1}</Contestant>, <Contestant>{$contestant2}</Contestant>)) and
                $contestant1 != $contestant2
            return <result>{concat($contestant1, ' dominates ', $contestant2)}</result>
    }</query4>