<?php
	$conn = new mysqli ("localhost", "root", "", "smartdb");

	$now = new DateTime();
	$now->setTimezone(new DateTimezone('Asia/Karachi'));
	$currentDate = $now->format('Y-m-d');

	$query = "update tblproduct set prodStatus='Inactive' where prodEndDate='$currentDate'";
	if($conn->query($query))
	{
		$q = "select prodID,prodName,sellerID from tblproduct where prodStatus= 'Inactive' and prodEndDate = '$currentDate' ";
		$records = $conn->query($q);
		if($records)
		{
			while($row = $records->fetch_assoc())
			{
				$prodID = $row['prodID'];
				$prodName = $row['prodName'];
				$sellerID = $row['sellerID'];

				$checkBids = "select bidderID,MAX(bidAmount) as bidAmount from tblbid where prodID = '$prodID' ";
				$lastBid = $conn->query($checkBids);
				if($lastBid)
				{
					while($row1 = $lastBid->fetch_assoc())
					{
						$bidderID = $row1['bidderID'];
						$bidAmount = $row1['bidAmount'];
					}

					$bidderDetails = "select bidderName,bidderEmail,bidderPhone,bidderCity,bidderAddress from tblbidder where bidderID = '$bidderID' ";
					$details = $conn->query($bidderDetails);
					if($details)
					{
						while($row2 = $details->fetch_assoc())
						{
							$bidderName = $row2['bidderName'];
							$bidderEmail = $row2['bidderEmail'];
							$bidderPhone = $row2['bidderPhone'];
							$bidderCity = $row2['bidderCity'];
							$bidderAddress = $row2['bidderAddress'];
						}
					}
				}

				$sellerDetails = "select sellerName,sellerEmail,sellerPhone,sellerCity,sellerAddress from tblseller where sellerID = '$sellerID' ";
				$details = $conn->query($sellerDetails);
				if($details)
				{
					while($row3 = $details->fetch_assoc())
					{
						$sellerName = $row3['sellerName'];
						$sellerEmail = $row3['sellerEmail'];
						$sellerPhone = $row3['sellerPhone'];
						$sellerCity = $row3['sellerCity'];
						$sellerAddress = $row3['sellerAddress'];
					}
				}

				if($bidAmount)
				{
					// Seller Email
					$sellerSubject = 'Product Sold';
			      	$sellerMessage = "<span style='color:green'>Congratulations</span> Mr. <b>".$sellerName."</b>, your product ".$prodName." has been sold and buyer detail is given bellow. <br> Name : ".$bidderName." <br>Email : ".$bidderEmail."<br> Phone Number ".$bidderPhone."<br> City : ".$bidderCity."<br> Address : ".$bidderAddress."<br>Bid Amount : ".$bidAmount."<br>You can contact with bidder. <br> Regards : <br> <b style='color:green'>SMART BID (Online Bidding System)</b><br>";

			      	// Bidder Email
			      	$bidderSubject = 'Product Winner';
			       	$bidderMessage = "<span style='color:green'>Congratulation</span> Mr. <b>".$bidderName."</b>, you are the final and highest bidder of product ".$prodName.".<br>Now this is your product. Product seller detail is given bellow. <br> Name : ".$sellerName." <br>Email : ".$sellerEmail."<br> Phone Number ".$sellerPhone."<br> City : ".$sellerCity."<br> Address : ".$sellerAddress."<br>You can contact with seller. <br> Regards : <br> <b style='color:green'>SMART BID (Online Bidding System)</b><br>";
			        
			        // To send HTML mail, the Content-type header must be set
			        $headers[] = 'MIME-Version: 1.0';
			        $headers[] = 'Content-type: text/html; charset=iso-8859-1';
			        
			        // Additional headers
			        $headers[] = 'From:SmartBID';
			        $headers[] = 'Cc:SmartBID';
			        $headers[] = 'Bcc:SmartBID';
			        
			        // Seller Mail 
			        mail($sellerEmail, $sellerSubject, $sellerMessage, implode("\r\n", $headers));

			        // Bidder Mail
			        mail($bidderEmail, $bidderSubject, $bidderMessage, implode("\r\n", $headers));
				}
				else 
				{
					$sellerSubject = 'Product Unsold';
			      	$sellerMessage ="<span style='color:red'>Sorry</span> Mr. <b>".$sellerName."</b> your product ".$prodName." remain unsold <br>No one bid your product<br> Regards : <br> <b style='color:green'>SMART BID (Online Bidding System)</b><br>";
			      	echo $sellerEmail;

			      	// To send HTML mail, the Content-type header must be set
			        $headers[] = 'MIME-Version: 1.0';
			        $headers[] = 'Content-type: text/html; charset=iso-8859-1';
			        
			        // Additional headers
			        $headers[] = 'From:SmartBID';
			        $headers[] = 'Cc:SmartBID';
			        $headers[] = 'Bcc:SmartBID';
			        
			        // Seller Mail 
			        mail($sellerEmail, $sellerSubject, $sellerMessage, implode("\r\n", $headers));
				}
			}
		}
	}
?>