function npv = hitungNPV(cashFlows, discountRate, nilaiAwal)
    % hitungNPV Menghitung Net Present Value (NPV)
    % cashFlows: Array yang berisi arus kas untuk tiap periode
    % discountRate: Tingkat diskonto dalam bentuk desimal (misalnya 0.1 untuk 10%)
    
    n = length(cashFlows);  % Jumlah periode
    npv = -nilaiAwal;;  % Inisialisasi NPV
    
    % Loop untuk menghitung NPV
    for t = 1:n
        npv = npv + cashFlows(t) / (1 + discountRate)^t;
    end
end
