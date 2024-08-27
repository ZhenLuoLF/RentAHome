<div%@
  page
  language="java"
  contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"
  %
>
  <div%@
    page
    language="java"
    contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    %
  >
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Reservation Confirmation</title>
        <link
          rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        />
        <style>
          h2 {
            font-family: Arial, sans-serif;
            color: #737171;
            font-size: 40px;
            font-weight: 900;
          }
          p {
            font-size: 18px;
            font-family: Arial, sans-serif;
          }
          body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f8f8f8;
          }
          .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
          }
          .header-img {
            width: 100%;
            border-radius: 8px;
            margin-bottom: 20px;
          }
          h4 {
            font-size: 30px;
            font-weight: bold;
            color: #494747;
            margin-bottom: 20px;
          }
          .info-section {
            margin-bottom: 20px;
          }
          .info-section h4 {
            font-size: 20px;
            margin-bottom: 10px;
          }
          .info-section p {
            margin: 0;
          }
          .confirm-btn {
            display: block;
            width: 100%;
            background-color: #ff5a5f;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 8px;
            text-align: center;
            text-decoration: none;
            font-size: 18px;
          }
          .confirm-btn:hover {
            background-color: #e0484f;
          }
          .section-divider {
            border-top: 1px solid #ddd;
            margin: 20px 0;
          }
        </style>
      </head>

      <body>
        <div></div>
        <div class="container">
          <h2>Please confirm your new reservation</h2>
          <img
            src="/images/property.jpg"
            alt="Property Image"
            class="header-img"
          />
          <h4>Summer Savings! Jacuzzi, Private Yard & Wi-Fi</h4>
          <p>Entire home/apt hosted by Macho</p>

          <div class="section-divider"></div>

          <div class="info-section">
            <h4>Check-in</h4>
            <p>Wed, Aug 7</p>
            <p>4:00 PM - 6:00 PM</p>
          </div>

          <div class="info-section">
            <h4>Checkout</h4>
            <p>Fri, Aug 9</p>
            <p>10:00 AM</p>
          </div>

          <div class="section-divider"></div>

          <div class="info-section">
            <h4>Address</h4>
            <p>301 E Barker Blvd, Big Bear, CA 92314, USA</p>
            <a href="#">Get directions</a>
          </div>

          <div class="section-divider"></div>

          <div class="info-section">
            <h4>Guests</h4>
            <p>4 adults</p>
            <a href="#">Invite guests</a>
          </div>

          <div class="section-divider"></div>

          <div class="info-section">
            <h4>Cancellation policy</h4>
            <p>
              Cancel before check-in at 4:00 PM on Aug 7 for a partial refund.
              After that, this reservation is non-refundable.
            </p>
            <p>Cutoff times are based on the listing's local time</p>
            <a href="#">More details</a>
          </div>

          <div class="section-divider"></div>

          <div class="info-section">
            <h4>Payments</h4>
            <p>Apple Pay</p>
            <p>Aug 07, 2024 - 08:29 AM BNT</p>
            <br />
            <h4>Amount paid (USD)</h4>
            <h4>$391.21</h4>
          </div>

          <div class="section-divider"></div>

          <a href="/message/confirmation" class="confirm-btn"
            >Confirm Reservation</a
          >
        </div>
      </body>
    </html>
  </div%@>
</div%@>
